

img_dir = './'; % folder of the stack images
N=32; % number of the images in the DATA folder

strfile = 'IM_0001';
    img = dicomread(fullfile(img_dir, strfile));
    siz_img = size(img);
    iradonMatrix=zeros (siz_img(1),siz_img(2),N);
    
   %while(true)
   for ii=1:N
       
        strfile = sprintf('IM_%04d',ii);
        image=dicomread(fullfile(img_dir, strfile));
        infoImage = dicominfo(fullfile(img_dir, strfile));
        if ii == 1
            [fighandle, surfh(ii)] = DrawImageSlice3D(fullfile(img_dir, strfile), [], 0.1);
        else
            [fighandle, surfh(ii)] = DrawImageSlice3D(fullfile(img_dir, strfile), fighandle, 0.1);
        end
        %R = radon(image,0:179);
        %I2 = iradon(R,0:179,'linear','Shepp-Logan');
        %iradonMatrix (:,:,1,ii) = image;
       
        %imshow(imcomplement(I2), [])
   end
   rotate3d(fighandle);
  %{ 
        for ii=N:-1:1
        strfile = sprintf('IM_%04d',ii);
        image=dicomread(fullfile(img_dir, strfile));
        
        infoImage = dicominfo(fullfile(img_dir, strfile));
        R = radon(image,0:179);
        I2 = iradon(R,0:179,'linear','Shepp-Logan');
        iradonMatrix (:,:,1,ii) = image;
        imshow(imcomplement(I2), [])
        

   end
   %}
   
   %end

  