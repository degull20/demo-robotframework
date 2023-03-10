import os

# Get the current operating system
if os.name == "nt":
    # Windows environment
    jenkins_jobs_cmd = "jenkins-jobs.exe"
else:
    # Linux environment
    jenkins_jobs_cmd = "jenkins-jobs"

# Build the command string
command = f"{jenkins_jobs_cmd} --conf jenkins_jobs.ini update jenkin_jobs\jobs"

# Run the command
try:
    os.system(command)
except Exception as e:
    print("Error running command:", e)
