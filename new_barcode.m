clear all;
barcodeMotorPort = 'A';
barcodeSensorPort = 1;
marbleSensorPort = 2;
marbleLauncherPort = 'D';
cupSpinnerPort='C';
dumperPort='B';
rotationDistance = 360;
rotationSpeed = -42;
interval = 270;
barcodeSpeed=20;
numBarcodes=1;
launchSpeed=40;
cupSpeed=30;

brick = legoev3('usb');
barcodeMotor = motor(brick, barcodeMotorPort);
barcodeSensor= colorSensor(brick, barcodeSensorPort);
marbleSensor = colorSensor(brick, marbleSensorPort);
marbleLauncher = motor(brick,marbleLauncherPort);
cupSpinner = motor(brick,cupSpinnerPort);
dumper = motor(brick,dumperPort);
dumperSpeed=25;
map = containers.Map;




cupSpinner.Speed=cupSpeed;
start(cupSpinner);

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


while(total>0)
	marbletype = rgb_determine_marble(marbleSensor);
	if(isKey(map,marbletype))
		num=map(marbletype);
	else
		num = 0;
	end
	if(num>0)
		rotateDist(marbleLauncher,360,launchSpeed,false);
		pause(3);
		dump(dumper,dumperSpeed,false);
		total = total - 1;
		map(marbletype)=map(marbletype)-1;
		if(map(marbletype)<1)
			remove(map,marbletype);
		end
	else
		rotateDist(marbleLauncher,360,launchSpeed,false);
		pause(3);
		dump(dumper,dumperSpeed,true);
	end
end


marbleLauncher.Speed=launchSpeed;


