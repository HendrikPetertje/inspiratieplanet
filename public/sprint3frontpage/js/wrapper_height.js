				Array.max = function(array) {
				    return Math.max.apply(Math, array);
				};

				var max = Array.max(Collums);
				console.log(max);