var Airpush = Class(function () {
	this.track = function (name, data) {
		logger.log("{airpush} track: ", name, data);
		NATIVE && NATIVE.plugins && NATIVE.plugins.sendEvent &&
			NATIVE.plugins.sendEvent("AirpushPlugin", "airpush",
				JSON.stringify({ eventName: name, params: data }));
	};
});

exports = new Airpush();
