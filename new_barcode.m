clear all;
barcodeMotorPort = 'A';
barcodeSensorPort = 1;
rotationDistance = 360;
rotationSpeed = -42;
interval = 30;
barcodeSpeed=20;
numBarcodes=3;

brick = legoev3('usb');
barcodeMotor = motor(brick, barcodeMotorPort);
barcodeSensor= colorSensor(brick, barcodeSensorPort);
map = containers.Map;

for i = 1:numBarcodes
	binary = read_Barcode(barcodeMotor,barcodeSensor,barcodeSpeed,interval);
	tmap = createList(binary);
	map = [map ; tmap];
end
