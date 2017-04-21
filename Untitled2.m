clear all;
barcodeMotorPort = 'C';  %**ALL THE PORTS HAVE CHANGED; UPDATE THEM
barcodeSensorPort = 1;
marbleSensorPort = 2;
marbleLauncherPort = 'D';
cupSpinnerPort='A';
dumperPort='B';
rotationDistance = 360;
rotationSpeed = -42;
interval = 270;
barcodeSpeed=20;
numBarcodes=1;
launchSpeed=40;
cupSpeed=0; %30

brick = legoev3('usb');
barcodeMotor = motor(brick, barcodeMotorPort);
barcodeSensor= colorSensor(brick, barcodeSensorPort);
marbleSensor = colorSensor(brick, marbleSensorPort);
marbleLauncher = motor(brick,marbleLauncherPort);
cupSpinner = motor(brick,cupSpinnerPort);
dumper = motor(brick,dumperPort);
dumperSpeed=25;
% 
% for(i=1:10)
%     playTone(brick,250*(.5*i),.1,5*i)
%     pause(.05)
% end
% marbleLauncher.Speed = -42
% start(marbleLauncher)
% pause(1)
% stop(marbleLauncher)
arrR = [];
arrG = [];
arrB = [];
refL = [];
ambL = [];

for(i=1:42)
    bub = readColorRGB(marbleSensor);
    ambL(end+1) = readLightIntensity(marbleSensor,'ambient');
    refL(end+1) = readLightIntensity(marbleSensor,'reflected');
    
    arrR(end+1) = bub(1);
    arrG(end+1) = bub(2);
    arrB(end+1) = bub(3);
end
arrAll = [sum(arrR) sum(arrG) sum(arrB)];
sumRef=[sum(refL)];
refavg=sumRef./length(refL)
refRng = [min(refL) max(refL)]

arrRng = [min(arrR) max(arrR) min(arrG) max(arrG) min(arrB) max(arrB)]
arrAvg = [0 0 0];
arrAvg(1) = arrAll(1)/length(arrR);
arrAvg(2) = arrAll(2)/length(arrG);
arrAvg(3) = arrAll(3)/length(arrB);
display(arrAvg)

sumRefA=[sum(ambL)];
refavg=sumRefA./length(ambL)
refAng = [min(ambL) max(ambL)]


