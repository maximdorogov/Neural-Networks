function [ salida ] = get_outputs_from_NN( W_in,W_out, inputs )
            
            X_in1 = [inputs(1,:) 1]';
            X_in2 = [inputs(2,:) 1]';
            X_in3 = [inputs(3,:) 1]';
            X_in4 = [inputs(4,:) 1]';
            
            X = [X_in1  X_in2 X_in3  X_in4];
            
            out_hidden_layer =tanh( W_in*X);    
            
            salida = tanh(W_out*[out_hidden_layer;1 1 1 1])';

            
end

