clear all;
barcodeMotorPort = 'A';
barcodeSensorPort = 1;
marbleSensorPort = 2;
marbleLauncherPort = 'B';
cupSpinnerPort='C';
dumperPort='D';
rotationDistance = 360;
rotationSpeed = -42;
interval = 285;
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
	map = [map ; tmap];
end
n = sum(values(map));


while(n>0)
	marbletype = rgb_determine_marble(marbleSensor);
	num = values(map,marbletype);
	if(num>0)
		dump(dumper,dumperSpeed,false);
		n = n - 1;
	else
		dump(dumper,dumperSpeed,true);
	end
end


marbleLauncher.Speed=launchSpeed;


