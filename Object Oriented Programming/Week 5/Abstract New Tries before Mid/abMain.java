abstract class Animal{
   abstract public void eat();
    abstract public void makeSound();
}

class Dog extends Animal{

    public void eat(){
        System.out.println("Dog Eats Pedigree");
    }
    public void makeSound(){
        System.out.println("Woof Woof");
    }
}

class Cat extends Animal{
    public void eat(){
        System.out.println("Cat Eats Whizkas");
    }
    public void makeSound(){
        System.out.println("Meow Meow");
    }
}

class abMain{
    public static void main(String args[]){

        Animal doggo = new Dog();
        doggo.eat();
        doggo.makeSound();

        Animal cat = new Cat();
        cat.eat();
        cat.makeSound();
    }
}