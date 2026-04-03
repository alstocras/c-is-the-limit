extends Node;

const SPEED_OF_LIGHT_IN_HERTZ_METRES: float = 299_792_458.0;

func getLorentzFactorFromVelocityInHertzMetres(velocity: float) -> float:
	var safeVelocity: float = clamp(velocity, 0, SPEED_OF_LIGHT_IN_HERTZ_METRES - 1e-5);
	return (sqrt(1 - (safeVelocity ** 2) / (SPEED_OF_LIGHT_IN_HERTZ_METRES ** 2))) ** -1;
	
func getRelativeTimeInSecondsFromVelocityInHertzMetresAndProperTimeInSeconds(velocity: float, properTime: float) -> float:
	return properTime * getLorentzFactorFromVelocityInHertzMetres(velocity);
	
func getRelativeLengthInMetresWithRestFrameLengthInMetresAndVelocityInHertzMetres(velocity: float, restFrameLength: float) -> float:
	return restFrameLength / getLorentzFactorFromVelocityInHertzMetres(velocity);
