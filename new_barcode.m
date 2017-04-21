clear all;
clearLCD;
barcodeMotorPort = 'C';  %**ALL THE PORTS HAVE CHANGED; UPDATE THEM
barcodeSensorPort = 1;
marbleSensorPort = 2;
marbleLauncherPort = 'D';
cupSpinnerPort='A';
dumperPort='B';
rotationDistance = 360;
rotationSpeed = -42;
interval = 250;
barcodeSpeed=20*3;
numBarcodes=1;
launchSpeed=40;
cupSpeed=40; %**
lcdLineDistance = 5;  %**

brick = legoev3('usb');
barcodeMotor = motor(brick, barcodeMotorPort);
barcodeSensor= colorSensor(brick, barcodeSensorPort);
marbleSensor = colorSensor(brick, marbleSensorPort);
marbleLauncher = motor(brick,marbleLauncherPort);
cupSpinner = motor(brick,cupSpinnerPort);
dumper = motor(brick,dumperPort);
dumperSpeed=30;
map = containers.Map;


%   Notes:
%       Make the cup spinner only spin before flips  %%might be fixed, see
%               bo
%       Recalibrate color sensor

cupSpinner.Speed=cupSpeed;
%   Where the start(cupSpinner) used to be

for i = 1:numBarcodes
	binary = read_Barcode(barcodeMotor,barcodeSensor,barcodeSpeed,interval);
	tmap = createList(binary);
	keys = tmap.keys;
	values= tmap.values;
	for n=1:length(keys)
		if(isKey(map,cell2mat(keys(n))))
			map(cell2mat(keys(n)))=map(cell2mat(keys(n)))+tmap(cell2mat(keys(n)));
		else
			map(cell2mat(keys(n)))=tmap(cell2mat(keys(n)));
		end
	end
end
total = sum(cell2mat(map.values));
printTotal = sprintf('total=%d\n',total);
writeLCD(brick,printTotal,2+lcdLineDistance);   %**

%   Possible code for displaying results on the lego's LCD in le loop
% for(k = 1:numBarcodes)
%     writeLCD(brick,printTotal,lcdLineDistance);
%     lcdLineDistance = lcdLineDistance + 1;
% end
%   End of possible code

start(cupSpinner);  %***

while(total>0)
    stop(cupSpinner)    %***
	marbletype = rgb_determine_marble(marbleSensor);
	if(isKey(map,marbletype))
		num=map(marbletype);
	else
		num = 0;
	end
	if(num>0)
		rotateDist(marbleLauncher,351,launchSpeed*-1,true); %351 in 2 slot
		pause(3);
		dump(dumper,dumperSpeed,false);
		total = total - 1;
		map(marbletype)=map(marbletype)-1;
		if(map(marbletype)<1)
			remove(map,marbletype);
		end
	else
		rotateDist(marbleLauncher,351,launchSpeed*-1,true);
		pause(3);
		dump(dumper,dumperSpeed,true);
    end
    start(cupSpinner)   %***
    pause(.5)      %*** 
end


marbleLauncher.Speed=launchSpeed;


