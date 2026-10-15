macOS System Utilities & Automation Scripts 

A collection of Zsh/Bash scripts built to automate file system organization and monitor real-time system performance on macOS environments. These tools demonstrate core OS-level scripting, resource tracking, and automated file management.

Included Scripts

1. System Monitor (monitor.sh)

-A terminal-based diagnostic dashboard that provides an instant overview of the system's health and hardware utilization.
-System & Uptime: Fetches OS version and current system uptime.
-Hardware Specs: Retrieves CPU architecture and RAM capacity using sysctl.
-Resource Utilization: Parses real-time data from top and df to display current CPU load, memory usage, and main disk partition storage.
-Power & Network: Tracks battery percentage/status (pmset) and fetches the local Wi-Fi IP address.
-Process Management: Identifies and lists the top 5 most CPU-intensive processes currently running using ps and awk.

2. Smart File Organizer (organizator.sh)

-An automation script that cleans up cluttered directories by categorizing and moving files into designated folders based on their extensions.
-Dynamic Targeting: Accepts a target directory as a command-line argument (defaults to the current directory).
-String Manipulation: Automatically extracts file extensions, handles files with no extensions, and converts uppercase extensions to lowercase for safe matching.
-Categorization Logic: Uses switch/case statements to route files (e.g., .png/.jpg to Imagini, .sh/.js to Programare).
-Safe Execution: Utilizes mkdir -p to prevent errors if destination folders already exist before executing the mv command.

How to Use:

Clone the repository and make the scripts executable before running them in your macOS terminal:

Make both scripts executable
chmod +x monitor.sh
chmod +x organizator.sh

Run the System Monitor
./monitor.sh

Run the File Organizer on the current directory
./organizator.sh

Or run the File Organizer on a specific path (e.g., your Downloads folder)
./organizator.sh ~/Downloads

Technologies & Commands Used
Shell: Zsh / sh

Core Commands: awk, grep, sed, sysctl, top, ps, pmset, basename
