Feature: Determine whether the value of a constant or variable defined in wp-config.php and wp-custom-config.php files is true.

  Scenario: Get the value of a constant whose value is true
    Given a WP install

    When I run `wp config set WP_TRUTH true`
    Then STDOUT should contain:
    """
    Success:
    """
    When I try `wp config is-true WP_TRUTH`
    Then STDOUT should be empty
    Then STDERR should be empty
    And the return code should be 0

    When I run `wp config set WP_TRUTH "true"`
    Then STDOUT should contain:
    """
    Success:
    """
    When I try `wp config is-true WP_TRUTH`
    Then STDOUT should be empty
    Then STDERR should be empty
    And the return code should be 0

    When I run `wp config set WP_FALSE_STRING "false"`
    Then STDOUT should contain:
    """
    Success:
    """
    When I try `wp config is-true WP_FALSE_STRING`
    Then STDOUT should be empty
    Then STDERR should be empty
    And the return code should be 0

    When I run `wp config set WP_STRING "foobar"`
    Then STDOUT should contain:
    """
    Success:
    """
    When I try `wp config is-true WP_STRING`
    Then STDOUT should be empty
    Then STDERR should be empty
    And the return code should be 0

  Scenario: Get the value of a constant whose value is not true
    Given a WP install

    When I run `wp config set WP_FALSE false --raw`
    Then STDOUT should contain:
    """
    Success:
    """
    When I try `wp config is-true WP_FALSE`
    Then STDOUT should be empty
    And the return code should be 1

# TODO: variable value true
# TODO: variable value false
# TODO: constant and variable with same name
# TODO: constant DNE
# TODO: constant defined in a seperate file included in wp-config (this works for `get` but not `has`)
# TODO: constant with value "0" is true (assert intention with boolval for future developers)