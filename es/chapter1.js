class A {
  constructor(){
    console.log("this.constructor.name = " + this.constructor.name);
    console.log("new.target.name = " + new.target.name);
  }
}

class B extends A {
}

class C extends A {
}

new C;
