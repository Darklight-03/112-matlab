function bool = dump(motor,speed,b)
	dist = 90;
	if(b==true)
		rotateDist(motor,dist,speed,false);
		pause(.2);
		rotateDist(motor,dist,speed*-1,false);
	else
		rotateDist(motor,dist,speed*-1,false);
		pause(.2);
		rotateDist(motor,dist,speed,false);
	end
	bool=true;
end
