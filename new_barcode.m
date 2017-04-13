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

barcodeMotor.Speed=barcodeSpeed;
while(readColor(barcodeSensor)~='black')
	start(barcodeMotor)
end
stop(barcodeMotor,1);
pause(1.5);
resetRotation(barcodeMotor);
start(barcodeMotor)

b_read = false;
points=[];
while(readRotation(barcodeMotor)<interval*8)
	if(readColor(barcodeSensor)=='black'&&b_read==false)
		b_read=true;
		points = [points readRotation(barcodeMotor)];
	end
	if(readColor(barcodeSensor)~='black')
		b_read=false;
	end
end

points = round(points./interval)+1;

points = [1 points];

binary = zeros(1,9);

for i = 1:max(size(points))
	binary(points(i))=1;
end

map=containers.Map('KeyType','string','ValueType','int32');

if(points(2:4)==[0 0 1])
	


rotateDistance2(barcodeMotor,rotationDistance,rotationSpeed,false);












