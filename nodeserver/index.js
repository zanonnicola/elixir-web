const crypto = require('crypto');
const {sendError, send, buffer, text} = require('micro');
const { router, get, post } = require('microrouter');

const hash = async (req, res) => {
	try {
		const buf = await buffer(req, {limit: '8mb', encoding: 'utf8'})
		// var md5 = crypto.createHash('md5').update(buf).digest('hex');
		send(res, 200, "md5");
	} catch (error) {
		return sendError(req, res, error);
	}
}

const notfound = (req, res) => send(res, 404, 'Not found route')

module.exports = 
	router(
		post('/post', hash),
		get('/*', notfound)
	);