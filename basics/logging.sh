YELLOW='\033[1;33m'
NC='\033[0m' # No Color
RED='\033[0;31m'
GREEN='\033[0;32m'
DATE=$(date  --rfc-3339='seconds')

LOGFILE="./main-log.txt"

write_log() {
    local message="$1"
    local local_message="${DATE} $message"
    echo -e "${GREEN}${DATE} $message ${NC}"
    echo "$local_message" >> "$LOGFILE"
}

write_error() {
    local message="$1"
    local local_message="${DATE} $message"
    echo -e "${RED}${DATE} $message ${NC}"
    echo "$local_message" >> "$LOGFILE"
}