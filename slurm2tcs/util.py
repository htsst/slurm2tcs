
import subprocess


def call(cmd):

    result = subprocess.run(cmd,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE)

    returncode = result.returncode
    stdout = result.stdout.decode()
    stderr = result.stdout.decode()

    return returncode, stdout, stderr

