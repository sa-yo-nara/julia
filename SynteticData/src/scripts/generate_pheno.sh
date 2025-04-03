#!/bin/sh
set -x
# Generate synthetic phenotypes
CURR_DIR=`pwd`
SCRIPT_DIR=$(dirname "$0")
cd $SCRIPT_DIR
#julia -e 'import Pkg; Pkg.add("ArgParse")'
#julia -e 'using Pkg; using Conda; Conda.add("python"); ENV["PYTHON"] = ""; Pkg.build("PyCall")'
julia --project=.. -e 'using Pkg; Pkg.instantiate(); using Conda; Conda.add("python"); ENV["PYTHON"] = ""; Pkg.build("PyCall"); Pkg.instantiate(); using Conda; Conda.add("bed-reader")'
julia --project=.. ../run_program.jl --phenotype --config "$1"
cd $CURR_DIR
