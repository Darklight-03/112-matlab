clear all;
barcodeMotorPort = 'A';
barcodeSensorPort = '1';
rotationDistance = 360;
rotationSpeed = -42;
interval = 30;
barcodeSpeed=20;


brick = legoev3('usb');
barcodeMotor = motor(brick, barcodeMotorPort);
barcodeSensor= colorSensor(brick, barcodeSensorPort);

binary = read_Barcode(barcodeMotor,barcodeSensor,barcodeSpeed);













