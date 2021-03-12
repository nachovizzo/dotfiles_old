#!/bin/bash

if compgen -G "**/*compile_commands.json" >/dev/null; then
    # Cleanup
    rm compile_commands.json 2>/dev/null
    rm tmp.json 2>/dev/null

    for json_file in **/*compile_commands.json; do
        echo "Merging $json_file..."
        sed -e '1s/^/[\'$'\n''/' -e '$s/,$/\'$'\n'']/' "$json_file" | sed 's/[][]//g' >>tmp.json
        echo , >>tmp.json
    done
    cat tmp.json | sed '$ s/.$//' >>tmp.json

    # Add the fucking square bracktes
    sed -i '1 i\[' tmp.json
    echo ] >>tmp.json

    # Format the json file
    python3 -m json.tool tmp.json >compile_commands.json || echo "Merging Failed" && exit 1
    rm tmp.json 2>/dev/null

    echo "Success, results ready in ./compile_commands.json"
else
    echo "No compile_commands.json files in $(pwd)"
fi
