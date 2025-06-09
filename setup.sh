#!bin.bash

# check is root of tyrano-template Repository
if [ -e ./.tyrano-template-root ]; then
    # check is not set up tyrano-template project
    if [ ! -e ./src/.complete ]; then
        # download and extract TyranoScript
        curl -OL https://tyrano.jp/download/studio/tyranoscript_v602b.zip
        unzip tyranoscript_v602b.zip

        # move files to src directory
        mv ./tyranoscript_v602b/* ./src/
        touch ./src/.gitkeep

        # cleanup
        rm tyranoscript_v602b.zip
        rm -rf tyranoscript_v602b

        # set complete flag
        touch ./src/.complete
    else
        echo "TyranoScript is already set up."
        exit 0
    fi
else
    echo "This script must be run from the root of a TyranoScript project."
    echo "Please navigate to the project directory and try again."
    exit 1
fi