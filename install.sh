#!/usr/bin/env bash
REPO=probe_accuracy_tests
VIRT_ENV=probe_accuracy_tests-env

cd "${HOME}" || exit
# Clone repo if it doesn't exist
[ -d "${REPO}" ] || git clone https://github.com/sporkus/probe_accuracy_tests 
cd "${REPO}"; git pull
chmod +x "${HOME}/${REPO}/run_probe_accuracy_test_suite.sh"

cd "${HOME}" || exit
if [ ! -d "${VIRT_ENV}" ]; then
    echo "Creating virtual environment"
    python3 -m venv "${VIRT_ENV}"
fi

# Install pip if it doesn't exist 
[ -x "$(command -v pip3)" ] || sudo apt install python3-pip libatlas3-base


source "${VIRT_ENV}/bin/activate"
echo "Installing requirements"
pip3 install -r "${HOME}/${REPO}/requirements.txt" --upgrade
deactivate

printf "\nUsage instructions:  %s/%s/run_probe_accuracy_test_suite.sh -h" "${HOME}" "${REPO}"
printf "\nMore details and updated instructions: \n\thttps://github.com/sporkus/probe_accuracy_tests/blob/master/README.md\n"