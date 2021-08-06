#!/usr/bin/env bash

 if [[ ${NODIS_INTERPRETER} == "python" ]]; then

    [[ -f requirements.txt ]] && pip install -r requirements.txt

    if python -m coverage run --source='.' -m pytest; then
        echo "Ok"
    else
        [[ $? -eq 5 ]] || exit $?
    fi

    python -m coverage xml

 fi

[[ -f coverage.xml ]] || touch coverage.xml