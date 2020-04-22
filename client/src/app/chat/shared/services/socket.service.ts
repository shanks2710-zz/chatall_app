import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Observer } from 'rxjs';
import { Message } from '../model/message';
import { Event } from '../model/event';

import * as socketIo from 'socket.io-client';

const SERVER_URL_AWS = 'http://a6942d2d9232b407682e7bfc8358c20f-1425548121.us-west-2.elb.amazonaws.com';
const SERVER_URL_DOCKER = 'http://192.168.99.100:4965';
const SERVER_URL_MINIKUBE = 'http://192.168.99.101:31425';
const SERVER_URL_LOCAL = 'http://localhost:8080';

@Injectable()
export class SocketService {
    private socket;

    public initSocketConnection(): void {
        this.socket = socketIo(SERVER_URL_AWS);
    }

    public sendMsg(message: Message): void {
        this.socket.emit('message', message);
    }

    public onMessage(): Observable<Message> {
        return new Observable<Message>(observer => {
            this.socket.on('message', (data: Message) => observer.next(data));
        });
    }

    public onEvent(event: Event): Observable<any> {
        return new Observable<Event>(observer => {
            this.socket.on(event, () => observer.next());
        });
    }
}
