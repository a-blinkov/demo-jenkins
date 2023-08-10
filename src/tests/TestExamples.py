import random


class TestExamples:
    def setup_class(self):
        pass

    def setup(self):
        pass

    def test_should_pass(self):
        pass

    def test_should_fail(self):
        raise AssertionError('The test is failed by design')

    def test_should_be_flaky(self):
        should_fail = random.choice([True, False])
        if should_fail:
            raise AssertionError('Test failed')

    def teardown(self):
        pass

    def teardown_class(self):
        pass
