//Segment
float distanceToSegment(vec2 a, vec2 b, vec2 p, out float projection){
	vec2 d = p - a;
	vec2 x = b - a;
	if(dot(x,x) <= 0.0001) return length(d);//#! needs improving; hot fix for normalization of 0 vector
	projection = dot(d, normalize(x));

	if(projection < 0.0)            return length(d);
	else if(projection > length(x)) return length(p - b);
	return sqrt(abs(dot(d,d) - projection*projection));
}
float distanceToSegment(vec2 a, vec2 b, vec2 p){
	float projection;
	return distanceToSegment(a, b, p, projection);
}