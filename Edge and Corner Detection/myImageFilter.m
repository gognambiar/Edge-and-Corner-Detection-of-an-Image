function [img1] = myImageFilter(img0,h)
        
        #h = fliplr(h);
        h = rot90(h,2);

       
	igr = size(img0,1);
	igc = size(img0,2);
        clr = size(img0,3);

	hr = size(h,1);
	hc = size(h,2);

	sr=0;sc=0;
	if mod(hr,2) == 0
	 sr = 1;
	endif

	if mod(hc,2) == 0
	 sc = 1;
	endif

	padr = floor(hr/2);
	padc = floor(hc/2);

	row1 = img0(1,:,:);
	row2 = img0(end,:,:);

        #padding starts 
	for i = 1:(padr)
	 img0 = [row1;img0];
	 img0 = [img0;row2];
	endfor

	col1 = img0(:,1,:);
	col2 = img0(:,end,:);

	for i = 1:(padc)
	 img0 = [col1,img0];
	 img0 = [img0,col2];
	endfor
        #padding ends        
        
	Filter = zeros(igr,igc,clr);
        #if(sumofh == 0)
         #sumofh = 1;
        sumofh = 1;
	for i = 1+padr:size(img0,1) - (padr*2)
	 for j = 1+padc:size(img0,2) - (padc*2)
	   temp = img0(i-padr:i+padr-sr,j-padc:j+padc-sc) .*h;
           if(sum(temp(:))/sumofh > 255)
            attd = 255;
           elseif(sum(temp(:))/sumofh < 0)
            attd = 0;
           else
            attd = sum(temp(:))/sumofh;
           endif
           Filter(i-padr,j-padc) = attd;
          

         endfor
        endfor

	#img1 = mat2gray(Filter);
        img1 = Filter;
        
	#imwrite(uint8(img1),"gaussianfilter.png");
         #figure;
         #imshow(uint8(img1));


endfunction
