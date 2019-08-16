using System;
using Xunit;
using BasicApi;
using BasicApi.Controllers;

namespace TestWebApi
{
    public class UnitTest1
    {
        [Fact]
        public void Test_default_greeting()
        {
            GreetingController greetingController = new GreetingController();
            string expectedMessage = "greet something";

            Assert.Equal(expectedMessage, greetingController.Get());
        }

        [Fact]
        public void Test_greet_value_when_hello()
        {
            GreetingController greetingController = new GreetingController();

            Assert.Equal("hi", greetingController.Get("hello").Value);
        }

        [Fact]
        public void Test_greet_value_when_hi()
        {
            GreetingController greetingController = new GreetingController();

            Assert.Equal("hello", greetingController.Get("hi").Value);
        }
    }
}
