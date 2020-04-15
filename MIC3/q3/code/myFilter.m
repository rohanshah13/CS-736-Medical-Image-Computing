function [out] = myFilter(w, L, filter)
   w = real(w);
   c = abs(w) <= L; 
   w(~c) = 0;
   if filter == "Ram-Lak"
    w(c) = abs(w(c));
   elseif filter == "Shepp-Logan"
    w(c) = sinc(w(c)*pi*0.5/L).*abs(w(c));
   elseif filter == "Cosine"
   w(c) = abs(w(c)).*cos(w(c)*pi/(2*L));
   end
   out = w;
end

