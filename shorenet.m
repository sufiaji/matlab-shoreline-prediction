load shoredata;
% size of input nodes
nodes = 64;
numhiddenneurons = 128;
% create custom network ...
net = network;
%% configure input layer
% number of input layer = 1
net.numInputs = 1;
% 9 neurons in input layer
net.inputs{1}.size = nodes;
% the range of input values is between 0 to 1
iranges = ones(nodes,2);
iranges(1:nodes,1) = 0;
net.inputs{1}.range = iranges;
%% configure hidden layers
% number of layers = 2: 1 hidden layer and 1 output layer
net.numLayers = 2;
% 48 neurons in hidden layer
net.layers{1}.size = numhiddenneurons;
% 9 neurons in output layer
net.layers{2}.size = nodes;
% last layer is output layer
net.outputConnect = [0 1];
%% layer connection and direction
net.inputConnect = [1 ; 0 ];
net.layerConnect = [0 0 ; 1 0 ];
% all neurons has bias
net.biasConnect = [1;1];
%% initial parameter values
% all neurons in all layers have tansig transfer function
net.layers{1:2}.transferFcn = 'satlin';
% all neurons in all layers have initial values based on Nguyen-Widrow
% algorithm
net.layers{1:2}.initFcn = 'initnw';
% Typically, net.initFcn is set to 'initlay', 
% which initializes each layer's weights and biases according to its net.layers{i}.initFcn.
net.initFcn = 'initlay';
% performance measurement...
net.performFcn = 'msereg';
net.trainFcn = 'trainscg';
net.trainParam.lr = 0.05;
net.trainParam.epochs = 10000;
net.trainParam.show = 10;
net.trainParam.goal = 0.0005;
%% apply algorithm in initFcn to initial network params
net = init(net);
net = train(net,inputdata,targetdata);
save net.mat net;