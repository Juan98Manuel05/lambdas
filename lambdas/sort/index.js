
// the following function sorts a list of tuples given a name and age, example users
exports.handler = async(event) => {
    try {
        const tuples = event.list_tuples
        const sortListDesc = tuples.sort((name, year) => year[1] - name[1])

        return {
            statusCode: 200,
            body: sortListDesc
        }

    } catch (error) {
        return {
            statusCode: 500,
            body: JSON.stringify({message: "Fatal error", error: error.message})
        }
    }
}