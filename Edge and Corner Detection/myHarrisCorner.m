function [R] = myHarrisCorner(Ix,Iy,threshold)

        format long g;
	Ixs = Ix.*Ix;
	Iys = Iy.*Iy;
	Ixy = Ix.*Iy;
         
        #Ix(:,:)
        #Ixs(:,:)

        h = fspecial('gaussian',[3,3], 5);
        
        Ixs = myImageFilter(Ixs,h);
        Iys = myImageFilter(Iys,h);
        Ixy = myImageFilter(Ixy,h);

     

	igr = size(Ix,1);
	igc = size(Ix,2);
	clr = size(Ix,3);

	R = zeros(1,2);

	k = 0.04;
        maxt = 0;


	for i = 1:igr
	 for j = 1:igc
	  #if(clr == 1) #greyscale image
	   Mo = [Ixs(i,j),Ixy(i,j);Ixy(i,j),Iys(i,j)];
           dt = det(Mo);
	   tra = trace(Mo);
	   temp = dt - k*tra*tra;
            if(temp > threshold)
             R = [R;[i j]];
            endif

	 endfor
	endfor

endfunction


