function histo = LocalWLDFeature(im, param)
    % Resize the image for division into blocks
    w = param.NumBlock;
    nr = size(im, 1); nc = size(im, 2);
    rb = floor(nr/w); cb = floor(nc/w);
    nnr = rb*w; nnc = cb*w;
    dr  = nr - nnr; dc = nc - nnc;
    nnr_s = round(dr/2); nnr_e = dr - nnr_s;
    nnc_s = round(dc/2); nnc_e = dc - nnc_s;
    im = im(nnr_s+1:nr-nnr_e, nnc_s+1:nnc - nnc_e);
    
    fun1 = @(block_struct) WLD_DescriptorMOp2(block_struct.data, param.T, param.M, param.S, 8, 1);
    fun2 = @(block_struct) WLD_DescriptorMOp2(block_struct.data, param.T, param.M, param.S, 16, 2);
    fun3 = @(block_struct) WLD_DescriptorMOp2(block_struct.data, param.T, param.M, param.S, 24, 3);
    switch w
         case 1
            I1 = blockproc(im,[rb cb],fun1);
            I2 = blockproc(im,[rb cb],fun2);
            I3 = blockproc(im,[rb cb],fun3);
            histo = [I1 I2 I3]';
         case 2
            I1 = blockproc(im,[rb cb],fun1);
            I2 = blockproc(im,[rb cb],fun2);
            I3 = blockproc(im,[rb cb],fun3);
            I11 = [I1(1,:) I1(2,:)];
            I22 = [I2(1,:) I2(2,:)];
            I33 = [I3(1,:) I3(2,:)];
            histo = [I11 I22 I33]';
         case 3
            I1 = blockproc(im,[rb cb],fun1);
            I2 = blockproc(im,[rb cb],fun2);
            I3 = blockproc(im,[rb cb],fun3);
            I11 = [I1(1,:) I1(2,:) I1(3,:)];
            I22 = [I2(1,:) I2(2,:) I2(3,:)];
            I33 = [I3(1,:) I3(2,:) I3(3,:)];
            histo = [I11 I22 I33]';
         case 4
            I1 = blockproc(im,[rb cb],fun1);
            I2 = blockproc(im,[rb cb],fun2);
            I3 = blockproc(im,[rb cb],fun3);
            I11 = [I1(1,:) I1(2,:) I1(3,:) I1(4,:)];
            I22 = [I2(1,:) I2(2,:) I2(3,:) I2(4,:)];
            I33 = [I3(1,:) I3(2,:) I3(3,:) I3(4,:)];
            histo = [I11 I22 I33]';
         case 5
            I1 = blockproc(im,[rb cb],fun1);
            I2 = blockproc(im,[rb cb],fun2);
            I3 = blockproc(im,[rb cb],fun3);
            I11 = [I1(1,:) I1(2,:) I1(3,:) I1(4,:) I1(5,:)];
            I22 = [I2(1,:) I2(2,:) I2(3,:) I2(4,:) I2(5,:)];
            I33 = [I3(1,:) I3(2,:) I3(3,:) I3(4,:) I3(5,:)];
            histo = [I11 I22 I33]';
         otherwise
            fprintf(err);
    end 
end

