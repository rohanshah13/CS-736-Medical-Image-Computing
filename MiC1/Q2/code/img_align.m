function [out] = img_align(ref , dyn)
    %this function aligns the 'dynamic image' wrt the reference image,
    %using method suggested in the paper Computer Vision and Image
    %understanding by T. F. Cootes et al.
    
    %removing translations
    ref = ref - mean(ref , 2); %% recentering the imgaes so that centroid lies at origin
    dyn = dyn - mean(dyn , 2);
    
    %%rescaling the images --not required
    %ref = ref/sqrt(sum(ref.^2,'all'));
    %dyn = dyn/sqrt(sum(dyn.^2,'all'));
   
    
    %%solving equations for a and b, a=scos(t), b=bssin(t)
    Z = sum(dyn(1,:).^2 + dyn(2,:).^2);
    A = sum(ref(1,:).*dyn(1,:) + ref(2,:).*dyn(2,:));
    B = sum(ref(2,:).*dyn(1,:) - ref(1,:).*dyn(2,:));
    
    a = A/Z;
    b = B/Z;
   
    %%applying the final transformation for aligining images
    out(1,:) = dyn(1,:)*a - dyn(2,:)*b;
    out(2,:) = dyn(1,:)*b + dyn(2,:)*a;
    
    %
    check = sqrt(sum(out.^2,'all'));
    
    %if check > 0
        %out = out/check; %should this line be commented ?
    %end
    %Discuss!!!!!!!!
    
    % The output image is a little smaller than the ref and dyn without --resolved
    %mn = mean(ref,2);
    %clf
    %hold on
    %img_plot(ref)
    %img_plot(dyn)
    %img_plot(out)
    %plot_img(dyn - out)
    %plot(mn(1),mn(2),'r*')
    %legend('ref','dyn','out')
end