#!/data/data/com.termux/files/usr/bin/bash
# =============================================================================
#  NexH4ck APT repository installer  (termuxvoid-style)
#  Adds the NexH4ck repo + signing key so you can: pkg install nexh4ck
#
#  Usage:
#    curl -fsSL https://raw.githubusercontent.com/Daemon-018/nexh4ck-repo/main/install.sh | bash
# =============================================================================

GREEN="\e[32m"; RED="\e[31m"; YELLOW="\e[33m"; CYAN="\e[36m"; MAGENTA="\e[35m"; RESET="\e[0m"
CHECK="✓"; CROSS="✗"; INFO=">>"

handle_error(){ echo -e "\n${RED}${CROSS} Error: $1${RESET}"; exit 1; }
run(){ echo -e "${YELLOW}${INFO} $1...${RESET}"; if eval "$2" >/dev/null 2>&1; then echo -e "${GREEN}${CHECK} $1 done${RESET}"; else handle_error "$1"; fi; }

echo -e "${MAGENTA}"
echo -e " ███╗   ██╗███████╗██╗  ██╗██╗  ██╗ █████╗  ██████╗██╗  ██╗"
echo -e " ████╗  ██║██╔════╝╚██╗██╔╝╚██╗██╔╝██╔══██╗██╔════╝██║ ██╔╝"
echo -e " ██╔██╗ ██║█████╗   ╚███╔╝  ╚███╔╝ ███████║██║     █████╔╝ "
echo -e " ██║╚██╗██║██╔══╝   ██╔██╗  ██╔██╗ ██╔══██║██║     ██╔═██╗ "
echo -e " ██║ ╚████║███████╗██╔╝ ██╗██╔╝ ██╗██║  ██║╚██████╗██║  ██╗"
echo -e " ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝"
echo -e "${CYAN}NexH4ck APT Repository Installer${RESET}"
echo -e ""

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"

run "Creating repository directory" "mkdir -p \$PREFIX/etc/apt/sources.list.d"
run "Adding NexH4ck repository" "echo 'deb [arch=all] https://daemon-018.github.io/nexh4ck-repo nexh4ck main' > \$PREFIX/etc/apt/sources.list.d/nexh4ck.list"
run "Downloading GPG key" "curl -sL https://daemon-018.github.io/nexh4ck-repo/nexh4ck-repo.gpg -o \$PREFIX/etc/apt/trusted.gpg.d/nexh4ck-repo.gpg"
run "Updating package lists" "apt update -y"

echo ""
echo -e "${GREEN}${CHECK} NexH4ck repository added!${RESET}"
echo -e "${CYAN}Install with: pkg install nexh4ck${RESET}"
echo -e "${YELLOW}ROE: only test systems you own or are authorized to test.${RESET}"
echo ""
