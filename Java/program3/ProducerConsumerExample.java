class Buffer {

    private int[] buffer;
    private int count = 0;
    private int size;

    public Buffer(int size) {
        this.size = size;

        buffer = new int[size];

    }

    // Producer adds an item

    public synchronized void produce(int item) throws InterruptedException {
        while (count == size) {

            wait(); // buffer full, wait for consumer to consume

        }

        buffer[count++] = item;

        System.out.println("Produced: " + item);

        notify(); // notify consumer that item is available

    }

    // Consumer removes an item

    public synchronized int consume() throws InterruptedException {

        while (count == 0) {

            wait(); // buffer empty, wait for producer to produce

        }

        int item = buffer[--count];

        System.out.println("Consumed: " + item);

        notify(); // notify producer that space is available

        return item;

    }

}

class Producer implements Runnable {

    private Buffer buffer;

    public Producer(Buffer buffer) {

        this.buffer = buffer;

    }

    public void run() {

        int item = 0;

        try {

            while (true) {

                buffer.produce(item++);

                Thread.sleep(500); // simulate time to produce item

            }

        } catch (InterruptedException e) {

            Thread.currentThread().interrupt();

        }

    }

}

class Consumer implements Runnable {

    private Buffer buffer;

    public Consumer(Buffer buffer) {

        this.buffer = buffer;

    }

    public void run() {

        try {

            while (true) {

                buffer.consume();

                Thread.sleep(1000); // simulate time to consume item

            }

        } catch (InterruptedException e) {

            Thread.currentThread().interrupt();

        }

    }

}

public class ProducerConsumerExample {

    public static void main(String[] args) {

        Buffer buffer = new Buffer(5); // buffer size 5

        Thread producerThread = new Thread(new Producer(buffer));
        Thread consumerThread = new Thread(new Consumer(buffer));

        producerThread.start();
        consumerThread.start();

    }

}
