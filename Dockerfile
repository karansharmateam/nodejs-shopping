# Base Image: 

FROM node:14-alpine AS builder

# Now we will create a folder for our container

WORKDIR /app

# Now we will copy our code from source to destination

COPY . .

# Now we will install our dependencies

RUN npm install

# now we are starting stage 2

FROM gcr.io/distroless/nodejs:14

# creare working directory for stage2

WORKDIR /app

#now copy only essentials from result

COPY --from=builder /app  .

# Now we wilL CONNECT  TO PORT

EXPOSE 3000

# Now we will kee running this app

CMD ["app.js"]
