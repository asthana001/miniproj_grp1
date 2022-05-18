clear;
clc;
clf;
more off
Nx = 64;
Ny = 64;
for i = 1:Nx
    for j = 1:Ny

c(i,j) = 0.5 + 0.1*(0.5 - rand());
    end
end 
mesh(c);
view(2) 
pause(0)

dt =0.5;
halfNx = Nx/2;
halfNy = Ny/2;
delkx = 2*pi/Nx;
delky = 2*pi/Ny;
A = 1.0;
M = 1.0;
kappa = 1.0; 

for m = 1:200
    for n = 1:8
        g = 2.*A.*c.*(1. -c).*(1.-2.*c);
        ghat = fft2(g);
        chat = fft2(c);
for i = 1:Nx
    if((i-1)<= halfNx)kx = (i-1)*delkx;
    end
    if((i-1)> halfNx)kx = (i-1-Nx)*delkx;
    end
for j = 1:Ny
      if ((j-1)<= halfNy)ky = (j-1)*delky;
      end 
      if((j-1)> halfNy)ky = (j-1-Ny)*delky;
      end

k2 = kx*kx + ky*ky;
k4 = k2*k2;

chat(i,j) = (chat(i,j) - M*dt*k2*ghat(i,j))/(1. +2*M*k4*dt);
  end
end
c = real(ifft2(chat));
end
contourf(c);
view(2);
axis equal
xlim([1 64])
ylim([1 64])
colorbar
caxis([0.0,1.0])
drawnow


end

