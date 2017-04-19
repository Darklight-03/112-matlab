clear all;

disp(g)
g=g+1;
barcodeMotorPort = 'A';

disp(g)
g=g+1;
barcodeSensorPort = 1;

disp(g)
g=g+1;
marbleSensorPort = 2;

disp(g)
g=g+1;
marbleLauncherPort = 'B';

disp(g)
g=g+1;
cupSpinnerPort='C';

disp(g)
g=g+1;
dumperPort='D';

disp(g)
g=g+1;
rotationDistance = 360;

disp(g)
g=g+1;
rotationSpeed = -42;

disp(g)
g=g+1;
interval = 285;

disp(g)
g=g+1;
barcodeSpeed=20;

disp(g)
g=g+1;
numBarcodes=1;

disp(g)
g=g+1;
launchSpeed=40;

disp(g)
g=g+1;
cupSpeed=30;

disp(g)
g=g+1;


disp(g)
g=g+1;
brick = legoev3('usb');

disp(g)
g=g+1;
barcodeMotor = motor(brick, barcodeMotorPort);

disp(g)
g=g+1;
barcodeSensor= colorSensor(brick, barcodeSensorPort);

disp(g)
g=g+1;
marbleSensor = colorSensor(brick, marbleSensorPort);

disp(g)
g=g+1;
marbleLauncher = motor(brick,marbleLauncherPort);

disp(g)
g=g+1;
cupSpinner = motor(brick,cupSpinnerPort);

disp(g)
g=g+1;
dumper = motor(brick,dumperPort);

disp(g)
g=g+1;
dumperSpeed=25;

disp(g)
g=g+1;
map = containers.Map;

disp(g)
g=g+1;


disp(g)
g=g+1;


disp(g)
g=g+1;


disp(g)
g=g+1;


disp(g)
g=g+1;
cupSpinner.Speed=cupSpeed;

disp(g)
g=g+1;
start(cupSpinner);

disp(g)
g=g+1;


disp(g)
g=g+1;
for i = 1:numBarcodes

disp(g)
g=g+1;
	binary = read_Barcode(barcodeMotor,barcodeSensor,barcodeSpeed,interval);

disp(g)
g=g+1;
	tmap = createList(binary);

disp(g)
g=g+1;
	keys = tmap.keys;

disp(g)
g=g+1;
	values= tmap.values;

disp(g)
g=g+1;
	for n=1:length(keys)

disp(g)
g=g+1;
		if(isKey(map,keys(n)))

disp(g)
g=g+1;
			map(keys(n))=map(keys(n))+tmap(keys(n));

disp(g)
g=g+1;
		else

disp(g)
g=g+1;
			map(keys(n))=tmap(keys(n));

disp(g)
g=g+1;
		end

disp(g)
g=g+1;
	end

disp(g)
g=g+1;
end

disp(g)
g=g+1;
total = sum(values(map));

disp(g)
g=g+1;


disp(g)
g=g+1;


disp(g)
g=g+1;
while(total>0)

disp(g)
g=g+1;
	marbletype = rgb_determine_marble(marbleSensor);

disp(g)
g=g+1;
	if(isKey(map,marbletype))

disp(g)
g=g+1;
		num=map(marbletype);

disp(g)
g=g+1;
	else

disp(g)
g=g+1;
		num = 0;

disp(g)
g=g+1;
	end

disp(g)
g=g+1;
	if(num>0)

disp(g)
g=g+1;
		dump(dumper,dumperSpeed,false);

disp(g)
g=g+1;
		total = total - 1;

disp(g)
g=g+1;
		map(marbletype)=map(marbletype)-1;

disp(g)
g=g+1;
		if(map(marbletype)<1)

disp(g)
g=g+1;
			remove(map,marbletype);

disp(g)
g=g+1;
		end

disp(g)
g=g+1;
	else

disp(g)
g=g+1;
		dump(dumper,dumperSpeed,true);

disp(g)
g=g+1;
	end

disp(g)
g=g+1;
end

disp(g)
g=g+1;


disp(g)
g=g+1;


disp(g)
g=g+1;
marbleLauncher.Speed=launchSpeed;

disp(g)
g=g+1;


disp(g)
g=g+1;


disp(g)
g=g+1;

