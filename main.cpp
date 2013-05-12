#include <cppunit/extensions/HelperMacros.h>
#include <cppunit/extensions/TestFactoryRegistry.h>
#include <cppunit/ui/text/TestRunner.h>

//--  test class declaration
class MySampleTest : public CppUnit::TestCase { 
  public:
    CPPUNIT_TEST_SUITE(MySampleTest);
    CPPUNIT_TEST(test_numeric);
    CPPUNIT_TEST_EXCEPTION(test_thrower, std::exception);
    CPPUNIT_TEST_SUITE_END();

  protected:
    void test_numeric();
    void test_thrower();
};

//--  auto test construction
CPPUNIT_TEST_SUITE_REGISTRATION(MySampleTest);

//--  test implementation
void MySampleTest::test_numeric() {
  CPPUNIT_ASSERT( 1 == 1 );
  CPPUNIT_ASSERT_EQUAL( 10 , 10 );
}

void MySampleTest::test_thrower() {
  throw std::exception();
}

int main()
{
  //--  setup
  CppUnit::TextUi::TestRunner runner;
  runner.addTest( CppUnit::TestFactoryRegistry::getRegistry().makeTest() );
  //--  run
  bool wasSuccessful = runner.run( "", false );
  return wasSuccessful;
}
