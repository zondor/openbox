set -e

echo "\033[0;34mCloning Open box install...\033[0m"
hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/zondor/openbox.git ~/.openbox-inst || {
  echo "git not installed"
  exit
}

bash ~/.openbox-inst/setup.sh


