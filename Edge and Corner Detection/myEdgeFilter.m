function [Im Io Ix Iy] = myEdgeFilter(img, sigma)

	function [pimg] = pixalate(Image,ir,ic,col)
		for i = 3:ir-2
		 for j = 3:ic-2
		  if(col == 1) #for greyscale images
		   if(Image(i,j) < Image(i-1,j) || Image(i,j) < Image(i+1,j))
		    Image(i,j) = 0;
		   endif
		  
		  else #for RGB images 
		   for z = 1:3
		    if(Image(i,j,z) < Image(i-1,j,z) || Image(i,j,z) < Image(i+1,j,z))
		    ImageX(i,j,z) = 0;
		    endif
		   endfor
		  endif
		 endfor
		endfor

	pimg = Image;

	endfunction



	h = fspecial('gaussian',[3,3], sigma);
	img1 = myImageFilter(img,h);
	Gradx = [-1,0,1;-2,0,2;-1,0,1];
	Grady = [1,2,1;0,0,0;-1,-2,-1]; #transpose(fliplr(Gradx));

	Ix = myImageFilter(img1,Gradx);
	Iy = myImageFilter(img1,Grady);

	igr = size(Ix,1);
	igc = size(Ix,2);
	clr = size(Ix,3);

	#Ix = pixalate(Ix,igr,igc,clr);
	#Iy = pixalate(Iy,igr,igc,clr);
	Im = sqrt(Ix.*Ix + Iy.*Iy);
        
        for i = 1:size(Ix,1)
         for j = 1:size(Ix,2)
          if Ix(i,j) != 0
           Io(i,j) = (atan(Iy(i,j)/Ix(i,j))/0.017);
          else
           Io(i,j) = 90;
          endif
         endfor
       endfor


        #figure;
        #imshow(uint8(Im));
        #title('Im');
        #figure;
        #imshow(uint8(Ix));
        #title('Ix');
        #figure;
        #imshow(uint8(Iy));
        #title('Iy');
	#Im = pixalate(Im,igr,igc,clr);
        
        #imwrite(Ix,"edgedetectorx.png");
        #imwrite(Iy,"edgedetectory.png"); 
	imwrite(Im,"EdgeIm.png");
        

endfunction
