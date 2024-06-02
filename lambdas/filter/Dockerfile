# use disk image of AWS Lambda to Node.js 18.x
FROM public.ecr.aws/lambda/nodejs:18

# copy file package.json y package-lock.json
COPY package*.json ./

# install dependencies
RUN npm install

# Copy app
COPY . .

# Comando para iniciar la Lambda
CMD ["index.handler"]
