import os
import subprocess

# Set the path to the Robot Framework script you want to run
ROBOT_SCRIPT_PATH = "/var/lib/jenkins/workspace/test_robot_Script_jobs/runny.py"

# Set the path to the output file for the Robot Framework results
ROBOT_OUTPUT_PATH = "/var/lib/jenkins/workspace/test_robot_Script_jobs/output.xml"

# Set any additional Robot Framework command line options
ROBOT_OPTIONS = "--variable ENV:prod"

# Change to the directory where your Robot Framework script is located
os.chdir(os.path.dirname(ROBOT_SCRIPT_PATH))

# Run the Robot Framework script using subprocess
subprocess.check_call(
    ["robot", ROBOT_OPTIONS, "--output", ROBOT_OUTPUT_PATH, ROBOT_SCRIPT_PATH]
)
