
mf=mfcc(m1,11000,30,0.5,13);
kelas{1}(1,:)=mean(mf');
mf=mfcc(m2,11000,30,0.5,13);
kelas{1}(2,:)=mean(mf');

mf=mfcc(d1,11000,30,0.5,13);
kelas{2}(1,:)=mean(mf');
mf=mfcc(d2,11000,30,0.5,13);
kelas{2}(2,:)=mean(mf');

mf=mfcc(a1,11000,30,0.5,13);
kelas{3}(1,:)=mean(mf');
mf=mfcc(a2,11000,30,0.5,13);
kelas{3}(2,:)=mean(mf');

mf=mfcc(k1,11000,30,0.5,13);
kelas{4}(1,:)=mean(mf');
mf=mfcc(k2,11000,30,0.5,13);
kelas{4}(2,:)=mean(mf');


%nilai awal
w{1}=mean(kelas{1})';
w{1}=mean(kelas{2})';
w{1}=mean(kelas{3})';
w{1}=mean(kelas{4})';
jum_output=4;
alfa=0.5;
epoch=1000;

for i=1:epoch %banyak iterasi
    for kel=1:length(kelas) %panjang koefisien
        for k=1:size(kelas{kel},1) %ukuran data
            inputnya=kelas{kel}(k,:);
            for outpu=1:jum_output %nilai output
                jarak(outpu)=norm(inputnya'-w{i}(:,outpu));
            end
            [kecil pemenang]=min(jarak);
            if pemenang==k
                w{i}(:,pemenang)=w{i}(:,pemenang)+alfa*(inputnya'-w{i}(:,pemenang));
            else
                w{i}(:,pemenang)=w{i}(:,pemenang)-alfa*(inputnya'-w{i}(:,pemenang));
            end
        end
    end
    w{i+1}=w{i};
    i;
    alfa=0.5*alfa;
end

lvqnya=w{epoch+1};
