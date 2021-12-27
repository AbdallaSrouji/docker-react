FROM node:alpine as builder
WORKDIR './app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- all the stuff that we are carried about. 

FROM nginx
COPY --from=builder /app/build /user/share/nginx/html

# we don't need to actually start nginx , its default command is to start it.
