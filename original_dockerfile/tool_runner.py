__author__="jls@cs.ucf.edu"

"""
tool_runner.py --

This script is used for running the checking tools within the Docker virtual machine, or, for testing, locally. It outputs a special format
 that is recognized by the tool that invokes it (try-jml). The output is of the following format:
 [verify-start]
 {
      "type"       : "esc"|"rac",  // esc or rac
      "returnCode" : numeric,      // zero means success. Error otherwise.
      "stdout"     : "",
      "stderr"     : "",
      "timeout"    : true|false    // if true, it took longer than the specified period
 }
 [verify-end]

Example Usage:

# cat ../src/test/stubs/Test2.java | python tool_runner.py --timeout 10 -esc Test2.java
# cat ../src/test/stubs/Test2.java | python tool_runner.py --timeout 10 -rac Test2.java

"""

import argparse
import sys
import subprocess
import os
import json
import tempfile
import traceback


#
# Argument parsing stuff
#
parser = argparse.ArgumentParser(description='Runs OpenJML verification tools.')


group = parser.add_mutually_exclusive_group()
group.add_argument("-esc", help="run the extended static checker", action="store_true")
group.add_argument("-rac", help="run the runtime assertion checker", action="store_true")


parser.add_argument("--timeout", type=int, help="number of seconds to wait before terminating a verification run.", default=10)
parser.add_argument("--docker",  help="Prefix the commands in such a way that it works in a container.", action="store_true" )

parser.add_argument("FILE", help="The name of the Java file to create")
parser.add_argument("DATA",
                    nargs="?",
                    help="The text of the program to check",
                    type=argparse.FileType('r'),
                    default=sys.stdin
                )

args = parser.parse_args()
return_dict = {}

if args.esc:
    return_dict['type'] = "esc"
elif args.rac:
    return_dict['type'] = "rac"
else:
    print("One of -esc or -rac must be specified")
    parser.print_help()
    sys.exit(1);

#
# Program begins
#
base = ""

if args.docker:
    base = "/"


# write file out

source_file = os.path.join(tempfile.mkdtemp(), args.FILE)

with open(source_file, "w") as out:
    out.write(args.DATA.read())

print("[tool-runner] Wrote temporary source file to: {0}".format(source_file))

# Configuration for platform specific settings
configuration = {
    'nt' :  {
        'timeout'  : 'C:/tools/cygwin/bin/timeout',
        'classpath' : "{0};{1}".format(
            os.path.dirname(source_file),
            os.path.join(base + "tools", "openjml", "jmlruntime.jar")
        )
    },
    'posix'   : {
        'timeout'  : 'timeout',
        'classpath' : "{0}:{1}".format(
            os.path.dirname(source_file),
            os.path.join(base + "tools", "openjml", "jmlruntime.jar")
        )
    }
}

timeout = configuration[os.name]['timeout']

process_args = [timeout, "{0}s".format(args.timeout)]

run_args  = [timeout, "{0}s".format(args.timeout)]

#
# OpenJML
#
if args.esc:
    process_args.append("java")
    process_args.append("-jar")
    process_args.append(os.path.join(base + "tools", "openjml", "openjml.jar"))
    process_args.append("-code-math=java")
    process_args.append("-esc")
    process_args.append(source_file)
else:
    process_args.append("java")
    process_args.append("-jar")
    process_args.append(os.path.join(base + "tools", "openjml", "openjml.jar"))
    process_args.append("-rac")
    process_args.append(source_file)

    run_args.append("java")
    run_args.append("-classpath")
    run_args.append(configuration[os.name]['classpath'])
    run_args.append(os.path.basename(source_file).split(".")[0])


# Build up argument list
return_dict = {"timeout": False}

try:
    process = subprocess.Popen(process_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout,stderr  = process.communicate()

    return_dict['returnCode'] = process.returncode
    return_dict['stdout'] = stdout.decode("utf-8")
    return_dict['stderr'] = stderr.decode("utf-8")
    return_dict['checkerArgs']   = process_args

    if process.returncode > 1:
        return_dict['timeout'] = True

    # if we are doing rac, we need to now run the program and observe the output

    if args.rac and process.returncode==0:
        print("Doing a RAC run for at most {0} seconds...".format(args.timeout))
        process = subprocess.Popen(run_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout,stderr  = process.communicate()

        return_dict['returnCode'] = process.returncode
        return_dict['stdout'] = stdout.decode("utf-8")
        return_dict['stderr'] = stderr.decode("utf-8")

        return_dict['runArgs'] = run_args

        if process.returncode > 1:
            return_dict['timeout'] = True

except:
    print("Exceptional condition")
    return_dict['returnCode'] = -1
    return_dict['stdout']     = ""
    return_dict['stderr']     = traceback.format_exc()



print("[verify-start]")
print(json.dumps(return_dict, sort_keys=True, indent=4))
print("[verify-end]")
