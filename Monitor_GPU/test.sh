echo "This is a test file."
# Say you want to finetune a caffemodel whenever the GPU is availabel
# You can do this:

gpuID=$1
./build/tools/caffe train -solver ./your_solver.prototxt -weights ./your_pretrained_model.caffemodel -gpu $gpuID
