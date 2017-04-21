resetRotation(barcodeMotor)
while(readRotation(barcodeMotor)<285)
    start(barcodeMotor);
end
stop(barcodeMotor);