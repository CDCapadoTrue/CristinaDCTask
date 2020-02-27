import CoreGraphics
import Foundation
import UIKit
import XCTest
import _SwiftXCTestOverlayShims

//
// Copyright (c) 2013-2015 Apple Inc. All rights reserved.
//
// Copyright (c) 1997-2005, Sen:te (Sente SA).  All rights reserved.
//
// Use of this source code is governed by the following license:
// 
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
// 
// (1) Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// 
// (2) Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation 
// and/or other materials provided with the distribution.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL Sente SA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// Note: this license is equivalent to the FreeBSD license.
// 
// This notice may not be removed from this file.

public var XCT_UI_TESTING_AVAILABLE: Int32 { get }
//
//  Copyright (c) 2014-2015 Apple Inc. All rights reserved.
//

/**
 * @const XCTestErrorDomain
 * Domain for errors provided by the XCTest framework.
 */
public let XCTestErrorDomain: String

public struct XCTestError {

    public init(_nsError: NSError)

    public static var errorDomain: String { get }

    /**
     * @typedef XCTestErrorCode
     * Error codes used with errors in the XCTestErrorDomain.
     *
     * @constant XCTestErrorCodeTimeoutWhileWaiting Indicates that a call to -waitForExpectationsWithTimeout:handler: timed out.
     * @constant XCTestErrorCodeFailureWhileWaiting Indicates that a failure assertion was raised while waiting in -waitForExpectationsWithTimeout:handler:.
     */
    public enum Code : Int {

        /**
         * @typedef XCTestErrorCode
         * Error codes used with errors in the XCTestErrorDomain.
         *
         * @constant XCTestErrorCodeTimeoutWhileWaiting Indicates that a call to -waitForExpectationsWithTimeout:handler: timed out.
         * @constant XCTestErrorCodeFailureWhileWaiting Indicates that a failure assertion was raised while waiting in -waitForExpectationsWithTimeout:handler:.
         */
        public typealias _ErrorType = XCTestError

        case timeoutWhileWaiting

        case failureWhileWaiting
    }

    public static var timeoutWhileWaiting: XCTestError.Code { get }

    public static var failureWhileWaiting: XCTestError.Code { get }
}
//
// Copyright (c) 2013-2015 Apple Inc. All rights reserved.
//
// Copyright (c) 1997-2005, Sen:te (Sente SA).  All rights reserved.
//
// Use of this source code is governed by the following license:
// 
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
// 
// (1) Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// 
// (2) Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation 
// and/or other materials provided with the distribution.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL Sente SA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// Note: this license is equivalent to the FreeBSD license.
// 
// This notice may not be removed from this file.

/**
 * @class XCTest
 *
 * An abstract base class for testing. XCTestCase and XCTestSuite extend XCTest to provide
 * for creating, managing, and executing tests. Most developers will not need to subclass
 * XCTest directly.
 */
open class XCTest : NSObject {

    
    /**
     * @property testCaseCount
     * Number of test cases. Must be overridden by subclasses.
     */
    open var testCaseCount: Int { get }

    
    /**
     * @property name
     * Test's name. Must be overridden by subclasses.
     */
    open var name: String { get }

    
    /**
     * @property testRunClass
     * The XCTestRun subclass that will be instantiated when the test is run to hold
     * the test's results. Must be overridden by subclasses.
     */
    open var testRunClass: AnyClass? { get }

    
    /**
     * @property testRun
     * The test run object that executed the test, an instance of testRunClass. If the test has not yet been run, this will be nil.
     */
    open var testRun: XCTestRun? { get }

    
    /**
     * @method -performTest:
     * The method through which tests are executed. Must be overridden by subclasses.
     */
    open func perform(_ run: XCTestRun)

    
    /**
     * @method -runTest
     * Creates an instance of the testRunClass and passes it as a parameter to -performTest:.
     */
    open func run()

    
    /**
     * @method -setUp
     * Setup method called before the invocation of each test method in the class.
     */
    open func setUp()

    
    /**
     * @method -tearDown
     * Teardown method called after the invocation of each test method in the class.
     */
    open func tearDown()
}
//
//  Copyright © 2017 Apple. All rights reserved.
//

/**
 * Represents a test activity.
 */
public protocol XCTActivity : NSObjectProtocol {

    
    /**
     * Human-readable name of the activity, given at creation time.
     */
    var name: String { get }

    
    /**
     * Adds an attachment which is always kept by Xcode, regardless of the test result.
     * Thread-safe, attachments can be added from any thread, are reported in the order they are added.
     */
    func add(_ attachment: XCTAttachment)
}
//
// Copyright (c) 2013-2015 Apple Inc. All rights reserved.
//
// Copyright (c) 1997-2005, Sen:te (Sente SA).  All rights reserved.
//
// Use of this source code is governed by the following license:
// 
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
// 
// (1) Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// 
// (2) Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation 
// and/or other materials provided with the distribution.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL Sente SA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// Note: this license is equivalent to the FreeBSD license.
// 
// This notice may not be removed from this file.

/**
 * @class XCTestCase
 * XCTestCase is a concrete subclass of XCTest that should be the override point for
 * most developers creating tests for their projects. A test case subclass can have
 * multiple test methods and supports setup and tear down that executes for every test
 * method as well as class level setup and tear down.
 *
 * To define a test case:
 *
 * • Create a subclass of XCTestCase.
 * • Implement -test methods.
 * • Optionally define instance variables or properties that store the state of the test.
 * • Optionally initialize state by overriding -setUp
 * • Optionally clean-up after a test by overriding -tearDown.
 *
 * Test methods are instance methods meeting these requirements:
 * • accepting no parameters
 * • returning no value
 * • prefixed with 'test'
 *
 * For example:

    - (void)testSomething;

 * Test methods are automatically recognized as test cases by the XCTest framework.
 * Each XCTestCase subclass's defaultTestSuite is a XCTestSuite which includes these
 * tests. Test method implementations usually contain assertions that must be verified
 * for the test to pass, for example:
 * @textblock

    @interface MathTest : XCTestCase {
    @private
        float f1;
        float f2;
    }

    - (void)testAddition;

    @end

    @implementation MathTest

    - (void)setUp
    {
        f1 = 2.0;
        f2 = 3.0;
    }

    - (void)testAddition
    {
        XCTAssertTrue (f1 + f2 == 5.0);
    }
    @end

 * @/textblock
 */
open class XCTestCase : XCTest {

    
    /**
     * @method -initWithInvocation:
     */
    public init(invocation: NSInvocation?)

    
    /**
     * @method -initWithSelector:
     */
    public init(selector: Selector)

    
    /**
     * @property invocation
     * The invocation used when this test is run.
     */
    open var invocation: NSInvocation?

    
    /**
     * @method -invokeTest
     * Invoking a test performs its setUp, invocation, and tearDown. In general this
     * should not be called directly.
     */
    open func invokeTest()

    
    /**
     * @property continueAfterFailure
     * Determines whether the test method continues execution after an XCTAssert fails.
     *
     * By default, this property is YES, meaning the test method will complete regardless of how many
     * XCTAssert failures occur. Setting this to NO causes the test method to end execution immediately
     * after the first failure occurs, but does not affect remaining test methods in the suite.
     *
     * If XCTAssert failures in the test method indicate problems with state or determinism, additional
     * failures may be not be helpful information. Setting `continueAfterFailure` to NO can reduce the
     * noise in the test report for these kinds of tests.
     */
    open var continueAfterFailure: Bool

    
    /**
     * @method -recordFailureWithDescription:inFile:atLine:expected:
     * Records a failure in the execution of the test and is used by all test assertions.
     *
     * @param description The description of the failure being reported.
     *
     * @param filePath The file path to the source file where the failure being reported
     * was encountered.
     *
     * @param lineNumber The line number in the source file at filePath where the
     * failure being reported was encountered.
     *
     * @param expected YES if the failure being reported was the result of a failed assertion,
     * NO if it was the result of an uncaught exception.
     *
     */
    open func recordFailure(withDescription description: String, inFile filePath: String, atLine lineNumber: Int, expected: Bool)

    
    /**
     * @property testInvocations
     * Invocations for each test method in the test case.
     */
    open class var testInvocations: [NSInvocation] { get }

    
    /**
     * @method -addTeardownBlock:
     * Registers a block to be run at the end of a test.
     *
     * Teardown blocks are executed after the current test method has returned but before
     * -tearDown is invoked.
     *
     * Registered blocks are run on the main thread but can be registered from any thread.
     * They are guaranteed to run only once, in LIFO order, and are executed serially. You
     * may register blocks during -setUp, but you may *not* register blocks during -tearDown
     * or from other teardown blocks.
     *
     * @param block A block to enqueue for future execution.
    */
    open func addTeardownBlock(_ block: @escaping () -> Void)

    
    /*!
     * @const XCTPerformanceMetric_WallClockTime
     * Records wall clock time in seconds between startMeasuring/stopMeasuring.
     */
    
    /**
     * @property defaultPerformanceMetrics
     * The names of the performance metrics to measure when invoking -measureBlock:. Returns XCTPerformanceMetric_WallClockTime by default. Subclasses can override this to change the behavior of -measureBlock:
     */
    open class var defaultPerformanceMetrics: [XCTPerformanceMetric] { get }

    
    /**
     * @method -measureBlock:
     *
     * Call from a test method to measure resources (+defaultPerformanceMetrics) used by the
     * block in the current process.
    
        - (void)testPerformanceOfMyFunction {
    
            [self measureBlock:^{
                // Do that thing you want to measure.
                MyFunction();
            }];
        }
    
     * @param block A block whose performance to measure.
     */
    open func measure(_ block: () -> Void)

    
    /**
     * @method -measureMetrics:automaticallyStartMeasuring:forBlock:
     *
     * Call from a test method to measure resources (XCTPerformanceMetrics) used by the
     * block in the current process. Each metric will be measured across calls to the block.
     * The number of times the block will be called is undefined and may change in the
     * future. For one example of why, as long as the requested performance metrics do
     * not interfere with each other the API will measure all metrics across the same
     * calls to the block. If the performance metrics may interfere the API will measure
     * them separately.
     
        - (void)testMyFunction2_WallClockTime {
            [self measureMetrics:[self class].defaultPerformanceMetrics automaticallyStartMeasuring:NO forBlock:^{
    
                // Do setup work that needs to be done for every iteration but you don't want to measure before the call to -startMeasuring
                SetupSomething();
                [self startMeasuring];
    
                // Do that thing you want to measure.
                MyFunction();
                [self stopMeasuring];
    
                // Do teardown work that needs to be done for every iteration but you don't want to measure after the call to -stopMeasuring
                TeardownSomething();
            }];
        }
    
     * Caveats:
     * • If YES was passed for automaticallyStartMeasuring and -startMeasuring is called
     *      anyway, the test will fail.
     * • If NO was passed for automaticallyStartMeasuring then -startMeasuring must be
     *      called once and only once before the end of the block or the test will fail.
     * • If -stopMeasuring is called multiple times during the block the test will fail.
     *
     * @param metrics An array of NSStrings (XCTPerformanceMetrics) to measure. Providing an unrecognized string is a test failure.
     *
     * @param automaticallyStartMeasuring If NO, XCTestCase will not take any measurements until -startMeasuring is called.
     *
     * @param block A block whose performance to measure.
     */
    open func measureMetrics(_ metrics: [XCTPerformanceMetric], automaticallyStartMeasuring: Bool, for block: () -> Void)

    
    /**
     * @method -startMeasuring
     * Call this from within a measure block to set the beginning of the critical section.
     * Measurement of metrics will start at this point.
     */
    open func startMeasuring()

    
    /**
     * @method -stopMeasuring
     * Call this from within a measure block to set the ending of the critical section.
     * Measurement of metrics will stop at this point.
     */
    open func stopMeasuring()
}
public struct XCTPerformanceMetric : Hashable, Equatable, RawRepresentable {

    public init(_ rawValue: String)

    public init(rawValue: String)
}
extension XCTPerformanceMetric {

    /**
     * @const XCTPerformanceMetric_WallClockTime
     * Records wall clock time in seconds between startMeasuring/stopMeasuring.
     */
    public static let wallClockTime: XCTPerformanceMetric
}

extension XCTestCase {

    
    /**
     * @property defaultTestSuite
     * Returns a test suite containing test cases for all of the tests in the class.
     */
    open class var defaultTestSuite: XCTestSuite { get }

    
    /**
     * @method +setUp
     * Suite-level setup method called before the class begins to run any of its test methods or their associated
     * per-instance setUp methods.
     */
    open class func setUp()

    
    /**
     * @method +tearDown
     * Suite-level teardown method called after the class has finished running all of its test methods and their
     * associated per-instance tearDown methods and teardown blocks.
     */
    open class func tearDown()
}

/**
 * XCTestCase conforms to XCTActivity, allowing test attachments to be added directly from test methods.
 *
 * See XCTAttachment.h for details on how to create attachments. Once created, they can be added directly to XCTestCase:
 *
 * @textblock
 
     - (void)testFoo
     {
         XCTAttachment *attachment = ...
         [self addAttachment:attachment];
     }
 
 * @/textblock
 */
extension XCTestCase : XCTActivity {
}

/**
 * Interface extension for measure related API.
 */
extension XCTestCase {

    
    /**
     * @property defaultMetrics
     * A collection of metrics to be taken by default when -measureBlock or -measureWithOptions:block: is called.
     */
    @available(iOS 13.0, *)
    open class var defaultMetrics: [XCTMetric] { get }

    
    /**
     * @property defaultMeasureOptions
     * Collection of configurable settings to change how measurements are taken.
     */
    @NSCopying open class var defaultMeasureOptions: XCTMeasureOptions { get }

    
    /**
     * @method -measureWithMetrics:block:
     * Measures the block using the provided metrics and the default options from your XCTestCase class.
     *
     * @param metrics A non-empty array of objects which adopt the XCTMetric protocol, describing the set of metrics to measure.
     * @param block The block to be measured.
     */
    @available(iOS 13.0, *)
    open func measure(metrics: [XCTMetric], block: () -> Void)

    
    /**
     * @method -measureWithOptions:block:
     * Measures the block using the default metrics from your XCTestCase class and the provided options.
     *
     * @param options An object describing the options to use when measuring the block, such as the number of times the block should be executed.
     * @param block The block to be measured.
     *
     * @seealso XCTMeasureOptions
     */
    @available(iOS 13.0, *)
    open func measure(options: XCTMeasureOptions, block: () -> Void)

    
    /**
     * @method -measureWithMetrics:options:block:
     * Measures the block using the provided metrics and options.
     *
     * @param metrics A non-empty array of objects which adopt the XCTMetric protocol, describing the set of metrics to measure.
     * @param options An object describing the options to use when measuring the block, such as the number of times the block should be executed.
     * @param block The block to be measured.
     */
    @available(iOS 13.0, *)
    open func measure(metrics: [XCTMetric], options: XCTMeasureOptions, block: () -> Void)
}
//
// Copyright (c) 2013-2015 Apple Inc. All rights reserved.
//
// Copyright (c) 1997-2005, Sen:te (Sente SA).  All rights reserved.
//
// Use of this source code is governed by the following license:
// 
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
// 
// (1) Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// 
// (2) Redistributions in binary form must reproduce the above copyright notice,
// this list of conditions and the following disclaimer in the documentation 
// and/or other materials provided with the distribution.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL Sente SA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// Note: this license is equivalent to the FreeBSD license.
// 
// This notice may not be removed from this file.

open class _XCTestCaseInterruptionException : NSException {
}

public func _XCTPreformattedFailureHandler(_ test: XCTestCase, _ expected: Bool, _ filePath: String, _ lineNumber: Int, _ condition: String, _ message: String)

public enum _XCTAssertionType : UInt {

    
    case fail

    case `nil`

    case notNil

    case equalObjects

    case notEqualObjects

    case equal

    case notEqual

    case equalWithAccuracy

    case notEqualWithAccuracy

    case greaterThan

    case greaterThanOrEqual

    case lessThan

    case lessThanOrEqual

    case `true`

    case `false`

    case `throws`

    case throwsSpecific

    case throwsSpecificNamed

    case noThrow

    case noThrowSpecific

    case noThrowSpecificNamed

    case unwrap
}

public func _XCTFailureFormat(_ assertionType: _XCTAssertionType, _ formatIndex: Int) -> String

public func _XCTDescriptionForValue(_ value: NSValue) -> String
extension XCTWaiter {

    
    /**
     * @enum XCTWaiterResult
     * Values returned by a waiter when it completes, times out, or is interrupted due to another waiter
     * higher in the call stack timing out.
     */
    public enum Result : Int {

        
        case completed

        case timedOut

        case incorrectOrder

        case invertedFulfillment

        case interrupted
    }
}

/**
 * @class XCTWaiter
 * Manages waiting - pausing the current execution context - for an array of XCTestExpectations. Waiters
 * can be used with or without a delegate to respond to events such as completion, timeout, or invalid 
 * expectation fulfillment. XCTestCase conforms to the delegate protocol and will automatically report
 * timeouts and other unexpected events as test failures.
 *
 * Waiters can be used without a delegate or any association with a test case instance. This allows test
 * support libraries to provide convenience methods for waiting without having to pass test cases through
 * those APIs.
 */
open class XCTWaiter : NSObject {

    
    /**
     * @method -initWithDelegate:
     * Creates a new waiter with the specified delegate.
     */
    public init(delegate: XCTWaiterDelegate?)

    
    /*!
     * @property delegate
     * The waiter delegate will be called with various events described in <XCTWaiterDelegate>.
     */
    
    weak open var delegate: XCTWaiterDelegate?

    
    /**
     * @property fulfilledExpectations
     * Returns an array containing the expectations that were fulfilled, in that order, up until the waiter
     * stopped waiting. Expectations fulfilled after the waiter stopped waiting will not be in the array.
     * The array will be empty until the waiter has started waiting, even if expectations have already been
     * fulfilled.
     */
    open var fulfilledExpectations: [XCTestExpectation] { get }

    
    /**
     * @method -waitForExpectations:timeout:
     * Wait on a group of expectations for up to the specified timeout. May return early based on fulfillment
     * of the waited on expectations.
     */
    open func wait(for expectations: [XCTestExpectation], timeout seconds: TimeInterval) -> XCTWaiter.Result

    
    /**
     * @method -waitForExpectations:timeout:enforceOrder:
     * Wait on expectations and specify whether they must be fulfilled in the given order. Expectations can
     * only appear in the list once.
     */
    open func wait(for expectations: [XCTestExpectation], timeout seconds: TimeInterval, enforceOrder enforceOrderOfFulfillment: Bool) -> XCTWaiter.Result

    
    /**
     * @method +waitForExpectations:timeout:
     * Convenience API that creates a waiter object which then waits on a group of expectations for up to
     * the specified timeout. May return early based on fulfillment of the waited on expectations. The waiter
     * is discarded when the wait completes.
     */
    open class func wait(for expectations: [XCTestExpectation], timeout seconds: TimeInterval) -> XCTWaiter.Result

    
    /**
     * @method +waitForExpectations:timeout:enforceOrder:
     * Convenience API that creates a waiter object which then waits on a group of expectations and optionally
     * enforces the order in which they are fulfilled. Expectations can only appear in the list once. The waiter
     * is discarded when the wait completes.
     */
    open class func wait(for expectations: [XCTestExpectation], timeout seconds: TimeInterval, enforceOrder enforceOrderOfFulfillment: Bool) -> XCTWaiter.Result
}

/**
 * @protocol XCTWaiterDelegate
 * Events are reported to the waiter's delegate via these methods. XCTestCase conforms to the delegate
 * protocol and will automatically report timeouts and other unexpected events as test failures.
 *
 * @note These methods are invoked on an arbitrary queue.
 */
public protocol XCTWaiterDelegate : NSObjectProtocol {

    
    /**
     * @method -waiter:didTimeoutWithUnfulfilledExpectations:
     * Invoked when not all waited on expectations are fulfilled during the timeout period. If the delegate
     * is an XCTestCase instance, this will be reported as a test failure.
     */
    func waiter(_ waiter: XCTWaiter, didTimeoutWithUnfulfilledExpectations unfulfilledExpectations: [XCTestExpectation])

    
    /**
     * @method -waiter:fulfillmentDidViolateOrderingConstraintsForExpectation:requiredExpectation:
     * Invoked when the -wait call has specified that fulfillment order should be enforced and an expectation
     * has been fulfilled in the wrong order. If the delegate is an XCTestCase instance, this will be reported
     * as a test failure.
     */
    func waiter(_ waiter: XCTWaiter, fulfillmentDidViolateOrderingConstraintsFor expectation: XCTestExpectation, requiredExpectation: XCTestExpectation)

    
    /**
     * @method -waiter:didFulfillInvertedExpectation:
     * Invoked when an expectation marked as inverted (/see inverted) is fulfilled. If the delegate is an
     * XCTestCase instance, this will be reported as a test failure.
     */
    func waiter(_ waiter: XCTWaiter, didFulfillInvertedExpectation expectation: XCTestExpectation)

    
    /**
     * @method -nestedWaiter:wasInterruptedByTimedOutWaiter:
     * Invoked when the waiter is interrupted prior to its expectations being fulfilled or timing out.
     * This occurs when an "outer" waiter times out, resulting in any waiters nested inside it being
     * interrupted to allow the call stack to quickly unwind.
     */
    func nestedWaiter(_ waiter: XCTWaiter, wasInterruptedByTimedOutWaiter outerWaiter: XCTWaiter)
}
//
//  Copyright (c) 2016 Apple Inc. All rights reserved.
//

/**
 * @class XCTestExpectation
 *
 * @discussion
 * Expectations represent specific conditions in asynchronous testing.
 */
open class XCTestExpectation : NSObject {

    
    /**
     * @method -initWithDescription:
     * Designated initializer, requires a nonnull description of the condition the expectation is checking.
     */
    public init(description expectationDescription: String)

    
    /**
     * @property expectationDescription
     * The human readable string used to describe the expectation in log output and test reports.
     */
    open var expectationDescription: String

    
    /**
     * @property inverted
     * If an expectation is set to have inverted behavior, then fulfilling it will have a similar effect that
     * failing to fulfill a conventional expectation has, as handled by the waiter and its delegate. Furthermore,
     * waiters that wait on an inverted expectation will allow the full timeout to elapse and not report
     * timeout to the delegate if it is not fulfilled.
     */
    open var isInverted: Bool

    
    /**
     * @property expectedFulfillmentCount
     * The expectedFulfillmentCount is the number of times -fulfill must be called on the expectation in order for it
     * to report complete fulfillment to its waiter. By default, expectations have a fufillmentCount of 1.
     * This value must be greater than 0 and is not meaningful if combined with \@inverted.
     */
    open var expectedFulfillmentCount: Int

    
    /**
     * If set, calls to fulfill() after the expectation has already been fulfilled - exceeding the fulfillment
     * count - will raise. This is the legacy behavior of expectations created through APIs on XCTestCase
     * but is not enabled for expectations created using XCTestExpectation initializers.
     */
    open var assertForOverFulfill: Bool

    
    /**
     * @method -fulfill
     *
     * @discussion
     * Call -fulfill to mark an expectation as having been met. It's an error to call -fulfill on an
     * expectation more times than its `expectedFulfillmentCount` value specifies, or when the test case
     * that vended the expectation has already completed. If `assertForOverFulfill` is set when either
     * of these occur, -fulfill will raise an exception.
     */
    open func fulfill()
}
extension XCTKVOExpectation {

    
    /**
     * @typedef
     * A block to be invoked when a change is observed for the keyPath of the observed object.
     *
     * @param observedObject
     * The observed object, provided to avoid block capture issues.
     *
     * @param change
     * The KVO change dictionary.
     *
     * @return
     * Return YES if the expectation is fulfilled, NO if it is not.
     */
    public typealias Handler = (Any, [AnyHashable : Any]) -> Bool
}

/**
 * @class XCTKVOExpectation
 * Expectation subclass for waiting on a condition defined Key Value Observation of a key path for an object.
 */
open class XCTKVOExpectation : XCTestExpectation {

    
    /**
     * @method -initWithKeyPath:object:expectedValue:options:
     *
     * @discussion
     * Initializes an expectation that is fulfilled when a key value coding compliant change is made such
     * that the specified key path of the observed object has the expected value.
     */
    public init(keyPath: String, object: Any, expectedValue: Any?, options: NSKeyValueObservingOptions = [])

    
    /**
     * @method -initWithKeyPath:object:expectedValue:
     *
     * @discussion
     * Initializes an expectation that is fulfilled when a key value coding compliant change is made such
     * that the specified key path of the observed object has the expected value. The NSKeyValueObservingOptions
     * passed for this initializer include NSKeyValueObservingOptionInitial, so the object/key path will be
     * checked immediately. The options also include NSKeyValueObservingOptionNew and NSKeyValueObservingOptionOld,
     * so if a handler is used the change dictionary passed to it will contain NSKeyValueChangeNewKey and
     * NSKeyValueChangeOldKey entries.
     */
    public convenience init(keyPath: String, object: Any, expectedValue: Any?)

    
    /**
     * @method -initWithKeyPath:object:
     *
     * @discussion
     * Convenience initializer that is fulfilled by any change to the specified key path of the observed object.
     * The NSKeyValueObservingOptions passed for this initializer do not include NSKeyValueObservingOptionInitial
     * since there is no value to check. If that behavior is desired in conjunction with a handler, use the
     * designated initializer. The options do include NSKeyValueObservingOptionNew and NSKeyValueObservingOptionOld,
     * so if a handler is used the change dictionary passed to it will contain NSKeyValueChangeNewKey and
     * NSKeyValueChangeOldKey entries.
     */
    public convenience init(keyPath: String, object: Any)

    
    /**
     * @property keyPath
     * Returns the key path that is being monitored for the KVO change.
     */
    open var keyPath: String { get }

    
    /**
     * @property observedObject
     * Returns the object that is being monitored for the KVO change.
     */
    open var observedObject: Any { get }

    
    /**
     * @property expectedValue
     * Returns the value that the expectation is waiting for the observed object/key path to have.
     */
    open var expectedValue: Any? { get }

    
    /**
     * @property options
     * The KVO options used when the expectation registered for observation. 
     */
    open var options: NSKeyValueObservingOptions { get }

    
    /**
     * @property handler
     * Allows the caller to install a special handler to do custom evaluation of the change to the value
     * of the object/key path. If a handler is set, expectedValue will be ignored.
     */
    open var handler: XCTKVOExpectation.Handler?
}
extension XCTNSNotificationExpectation {

    
    /**
     * @typedef
     * A block to be invoked when a notification matching the specified name is observed
     * from the object.
     *
     * @param notification
     * The notification object.
     *
     * @return
     * Return YES if the expectation is fulfilled, NO if it is not.
     */
    public typealias Handler = (Notification) -> Bool
}

/**
 * @class XCTNSNotificationExpectation
 * Expectation subclass for waiting on a condition defined by an NSNotification.
 */
open class XCTNSNotificationExpectation : XCTestExpectation {

    
    /**
     * @method -initWithName:object:notificationCenter:
     *
     * @discussion
     * Initializes an expectation that waits for an NSNotification to be posted by an optional object from
     * a given notification center.
     */
    public init(name notificationName: NSNotification.Name, object: Any?, notificationCenter: NotificationCenter)

    
    /**
     * @method -initWithName:object:
     *
     * @discussion
     * Initializes an expectation that waits for an NSNotification to be posted by an optional object from
     * the default notification center.
     */
    public convenience init(name notificationName: NSNotification.Name, object: Any?)

    
    /**
     * @method -initWithName:object:
     *
     * @discussion
     * Initializes an expectation that waits for an NSNotification to be posted by any object from
     * the default notification center.
     */
    public convenience init(name notificationName: NSNotification.Name)

    
    /**
     * @property notificationName
     * Returns the name of the notification being waited on.
     */
    open var notificationName: NSNotification.Name { get }

    
    /**
     * @property observedObject
     * Returns the object that will post the notification.
     */
    open var observedObject: Any? { get }

    
    /**
     * @property notificationCenter
     * Returns the notification center that is being used.
     */
    open var notificationCenter: NotificationCenter { get }

    
    /**
     * @property handler
     * Allows the caller to install a special handler to do custom evaluation of received notifications
     * matching the specified object and notification center.
     */
    open var handler: XCTNSNotificationExpectation.Handler?
}
extension XCTNSPredicateExpectation {

    
    /**
     * @typedef
     * Handler called when evaluating the predicate against the object returns true. If the handler is not
     * provided the first successful evaluation will fulfill the expectation. If provided, the handler will
     * be queried each time the notification is received to determine whether the expectation should be fulfilled
     * or not.
     */
    public typealias Handler = () -> Bool
}

/**
 * @class XCTNSPredicateExpectation
 * Expectation subclass for waiting on a condition defined by an NSPredicate and an object.
 */
open class XCTNSPredicateExpectation : XCTestExpectation {

    
    /**
     * @method -initWithPredicate:object:
     * Initializes an expectation that waits for a predicate to evaluate as true with the provided object.
     */
    public init(predicate: NSPredicate, object: Any?)

    
    /**
     * @property predicate
     * Returns the predicate used by the expectation.
     */
    @NSCopying open var predicate: NSPredicate { get }

    
    /**
     * @property object
     * Returns the object against which the predicate is evaluated.
     */
    open var object: Any? { get }

    
    /**
     * @property handler
     * Allows the caller to install a special handler to do custom evaluation of predicate and its object.
     */
    open var handler: XCTNSPredicateExpectation.Handler?
}
//
//  Copyright © 2014-2017 Apple Inc. All rights reserved.
//

/**
 * @category AsynchronousTesting
 *
 * @discussion
 * This category introduces support for asynchronous testing in XCTestCase. The mechanism
 * allows you to specify one or more "expectations" that will occur asynchronously
 * as a result of actions in the test. Once all expectations have been set, a "wait"
 * API is called that will block execution of subsequent test code until all expected
 * conditions have been fulfilled or a timeout occurs.
 */
extension XCTestCase : XCTWaiterDelegate {

    
    /**
     * @method -expectationWithDescription:
     *
     * @param description
     * This string will be displayed in the test log to help diagnose failures.
     *
     * @discussion
     * Creates and returns an expectation associated with the test case.
     */
    open func expectation(description: String) -> XCTestExpectation

    
    /*!
     * @typedef XCWaitCompletionHandler
     * A block to be invoked when a call to -waitForExpectationsWithTimeout:handler: times out or has
     * had all associated expectations fulfilled.
     *
     * @param error
     * If the wait timed out or a failure was raised while waiting, the error's code
     * will specify the type of failure. Otherwise error will be nil.
     */
    
    /**
     * @method -waitForExpectationsWithTimeout:handler:
     *
     * @param timeout
     * The amount of time within which all expectations must be fulfilled.
     *
     * @param handler
     * If provided, the handler will be invoked both on timeout or fulfillment of all
     * expectations. Timeout is always treated as a test failure.
     *
     * @discussion
     * -waitForExpectationsWithTimeout:handler: creates a point of synchronization in the flow of a
     * test. Only one -waitForExpectationsWithTimeout:handler: can be active at any given time, but
     * multiple discrete sequences of { expectations -> wait } can be chained together.
     *
     * -waitForExpectationsWithTimeout:handler: runs the run loop while handling events until all expectations
     * are fulfilled or the timeout is reached. Clients should not manipulate the run
     * loop while using this API.
     */
    open func waitForExpectations(timeout: TimeInterval, handler: XCWaitCompletionHandler? = nil)

    
    /**
     * @method -waitForExpectations:timeout:
     * Wait on a group of expectations for up to the specified timeout. May return early based on fulfillment
     * of the waited on expectations.
     */
    open func wait(for expectations: [XCTestExpectation], timeout seconds: TimeInterval)

    
    /**
     * @method -waitForExpectations:timeout:enforceOrder:
     * Wait on expectations and specify whether they must be fulfilled in the given order. Expectations
     * can only appear in the list once.
     */
    open func wait(for expectations: [XCTestExpectation], timeout seconds: TimeInterval, enforceOrder enforceOrderOfFulfillment: Bool)

    
    /**
     * @method -keyValueObservingExpectationForObject:keyPath:expectedValue:
     *
     * @discussion
     * A convenience method for asynchronous tests that use Key Value Observing to detect changes
     * to values on an object. This variant takes an expected value and observes changes on the object
     * until the keyPath's value matches the expected value using -[NSObject isEqual:]. If
     * other comparisions are needed, use the variant below that takes a handler block.
     *
     * @param objectToObserve
     * The object to observe.
     *
     * @param keyPath
     * The key path to observe.
     *
     * @param expectedValue
     * Expected value of the keyPath for the object. The expectation will fulfill itself when the
     * keyPath is equal, as tested using -[NSObject isEqual:]. If nil, the expectation will be
     * fulfilled by the first change to the key path of the observed object.
     *
     * @return
     * Creates and returns an expectation associated with the test case.
     */
    open func keyValueObservingExpectation(for objectToObserve: Any, keyPath: String, expectedValue: Any?) -> XCTestExpectation

    
    /**
     * @method -keyValueObservingExpectationForObject:keyPath:handler:
     *
     * @discussion
     * Variant of the convenience for tests that use Key Value Observing. Takes a handler
     * block instead of an expected value. Every KVO change will run the handler block until
     * it returns YES (or the wait times out). Returning YES from the block will fulfill the
     * expectation. XCTAssert and related APIs can be used in the block to report a failure.
     *
     * @param objectToObserve
     * The object to observe.
     *
     * @param keyPath
     * The key path to observe.
     *
     * @param handler
     * Optional handler, /see XCKeyValueObservingExpectationHandler. If not provided, the expectation will
     * be fulfilled by the first change to the key path of the observed object.
     *
     * @return
     * Creates and returns an expectation associated with the test case.
     */
    open func keyValueObservingExpectation(for objectToObserve: Any, keyPath: String, handler: XCTKVOExpectation.Handler? = nil) -> XCTestExpectation

    
    /**
     * @method -expectationForNotification:object:handler:
     *
     * @discussion
     * A convenience method for asynchronous tests that observe NSNotifications from the default
     * NSNotificationCenter.
     *
     * @param notificationName
     * The notification to register for.
     *
     * @param objectToObserve
     * The object to observe.
     *
     * @param handler
     * Optional handler, /see XCNotificationExpectationHandler. If not provided, the expectation
     * will be fulfilled by the first notification matching the specified name from the
     * observed object.
     *
     * @return
     * Creates and returns an expectation associated with the test case.
     */
    open func expectation(forNotification notificationName: NSNotification.Name, object objectToObserve: Any?, handler: XCTNSNotificationExpectation.Handler? = nil) -> XCTestExpectation

    
    /**
     * @method -expectationForNotification:object:notificationCenter:handler:
     *
     * @discussion
     * A convenience method for asynchronous tests that observe NSNotifications from a specific
     * NSNotificationCenter.
     *
     * @param notificationName
     * The notification to register for.
     *
     * @param objectToObserve
     * The object to observe.
     *
     * @param notificationCenter
     * The notification center from which to observe the notification.
     *
     * @param handler
     * Optional handler, /see XCNotificationExpectationHandler. If not provided, the expectation
     * will be fulfilled by the first notification matching the specified name from the
     * observed object.
     *
     * @return
     * Creates and returns an expectation associated with the test case.
     */
    open func expectation(forNotification notificationName: NSNotification.Name, object objectToObserve: Any?, notificationCenter: NotificationCenter, handler: XCTNSNotificationExpectation.Handler? = nil) -> XCTestExpectation

    
    /**
     * @method -expectationForPredicate:evaluatedWithObject:handler:
     * Creates an expectation that is fulfilled if the predicate returns true when evaluated with the given
     * object. The expectation periodically evaluates the predicate and also may use notifications or other
     * events to optimistically re-evaluate.
     */
    open func expectation(for predicate: NSPredicate, evaluatedWith object: Any?, handler: XCTNSPredicateExpectation.Handler? = nil) -> XCTestExpectation
}
/**
 * @typedef XCWaitCompletionHandler
 * A block to be invoked when a call to -waitForExpectationsWithTimeout:handler: times out or has
 * had all associated expectations fulfilled.
 *
 * @param error
 * If the wait timed out or a failure was raised while waiting, the error's code
 * will specify the type of failure. Otherwise error will be nil.
 */
public typealias XCWaitCompletionHandler = (Error?) -> Void
//
//  Copyright © 2019 Apple Inc. All rights reserved.
//

extension XCTestCase {

    
    /**
     * @method addUIInterruptionMonitorWithDescription:handler:
     *
     * @abstract Adds a monitor to the test. Monitors are automatically removed at the end of the test or can be manually removed using -removeUIInterruptionMonitor:.
     * Monitors are invoked in the reverse order in which they are added until one of the monitors returns true, indicating that it has handled the interruption.
     *
     * @param handlerDescription
     * Explanation of the behavior and purpose of this monitor, mainly used for debugging and analysis.
     *
     * @param handler
     * Handler block for asynchronous, non-deterministic interrupting UI such as alerts and other dialogs. Handlers should return true if they handled the UI, false if they did not.
     * The handler is passed an XCUIElement representing the top level UI element for the alert.
     *
     * @return Returns an opaque token that can be used to remove the monitor.
     *
     * @discussion
     * A "UI interruption" is any element which unexpectedly blocks access to an element with which a UI test is trying to interact. Interrupting elements are most commonly alerts,
     * dialogs, or other windows, but can be of other types as well. Interruptions are unexpected or at least not deterministic: the appearance of an alert in direct response to
     * a test action such as clicking a button is not an interruption and should not be handled using a UI interruption monitor. Instead, it's simply part of the UI and should be
     * found using standard queries and interacted with using standard event methods. Note that some interruptions are part of the app's own UI, others are presented on
     * behalf of system apps and services, so queries for these elements must be constructed with the right process at their root.
     *
     * Use a UI interruption monitor for alerts that appear unexpectedly or with non-deterministic timing. Monitors are not invoked simply by the appearance of an alert or similar
     * UI, they are called when the presence of such UI interferes with actions the test is attempting to take. For example, consider the following sequence:
     *
     * - test taps button
     * - app displays confirmation dialog
     *
     * In this case, the dialog that is presented can be anticipated by the test, so a UI interruption monitor should not be used. Instead, the sequence should look like:
     *
     * - test taps button
     * - test constructs an XCUIElement for the dialog and uses XCUIElement.waitForExistence(timeout:) to wait for it to appear
     * - app displays confirmation dialog
     * - test synthesizes a tap for the appropriate button in the dialog
     * - test continues execution
     *
     * There was no UI interruption in this example because every step was deterministic and known in advance. Note the use of XCUIElement.waitForExistence(timeout:) to deal with
     * asynchronous delays in the display of the dialog.
     *
     * By contrast, consider the next sequence, where use of a UI interruption monitor is the correct solution:
     *
     * - test launches app
     * - app initiates asynchronous network request
     * - test interacts with app
     * - network request completes, app decides to display a dialog to the user
     * - dialog appears just as the test is about to tap on a button
     *      - the appearance of the dialog is not deterministic
     *      - the test can anticipate that the dialog might be displayed at some point, but not when
     *      - accordingly, the test has installed a UI interruption monitor that knows how to handle the network response dialog
     * - when XCTest computes a hit point for the button, it discovers the dialog and treats it as "interrupting UI"
     * - the previously installed UI interruption monitor is invoked
     * - it handles the dialog
     * - XCTest computes the hit point for the button and synthesizes the requested tap event
     * - test execution continues...
     *
     * Monitors can be designed to be general or specific in how they handle interruptions. The simplest general approach might simply attempt to cancel/dismiss/close
     * any interrupting dialog/alert/window without consideration for its contents or purpose. A more specific monitor might make decisions based on the UI and contents
     * of the interruption. Tests may install multiple monitors, which will be invoked in reverse order of installation. If a more specific monitor wishes to be skipped for a
     * given interruption, its handler can simply return false - the next monitor will be invoked, and so on, until one of them returns true, signifying that it has handled
     * the interruption. In some cases, a default monitor may handle interruptions.
     */
    @available(iOS 9.0, *)
    open func addUIInterruptionMonitor(withDescription handlerDescription: String, handler: @escaping (XCUIElement) -> Bool) -> NSObjectProtocol

    
    /**
     * @method removeUIInterruptionMonitor:
     * 
     * @abstract Removes a monitor using the token provided when it was added.
     *
     * @param monitor
     * The token representing the monitor returned from the call to addUIInterruptionMonitorWithDescription:handler: where it was registered.
     */
    @available(iOS 9.0, *)
    open func removeUIInterruptionMonitor(_ monitor: NSObjectProtocol)
}
//
// Copyright (c) 2013-2015 Apple Inc. All rights reserved.
//
// Copyright (c) 1997-2005, Sen:te (Sente SA).  All rights reserved.
//
// Use of this source code is governed by the following license:
// 
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
// 
// (1) Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// 
// (2) Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation 
// and/or other materials provided with the distribution.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL Sente SA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// Note: this license is equivalent to the FreeBSD license.
// 
// This notice may not be removed from this file.

/**
 * @class XCTestRun
 * A test run collects information about the execution of a test. Failures in explicit
 * test assertions are classified as "expected", while failures from unrelated or
 * uncaught exceptions are classified as "unexpected".
 */
open class XCTestRun : NSObject {

    
    /**
     * @method -initWithTest:
     * Designated initializer for the XCTestRun class.
     *
     * @param test An XCTest instance.
     *
     * @return A test run for the provided test.
     */
    public init(test: XCTest)

    
    /**
     * @property test
     * The test instance provided when the test run was initialized.
     */
    open var test: XCTest { get }

    
    /**
     * @method -start
     * Start a test run. Must not be called more than once.
     */
    open func start()

    
    /**
     * @method -stop
     * Stop a test run. Must not be called unless the run has been started. Must not be called more than once.
     */
    open func stop()

    
    /**
     * @property startDate
     * The time at which the test run was started, or nil.
     */
    open var startDate: Date? { get }

    
    /**
     * @property stopDate
     * The time at which the test run was stopped, or nil.
     */
    open var stopDate: Date? { get }

    
    /**
     * @property totalDuration
     * The number of seconds that elapsed between when the run was started and when it was stopped.
     */
    open var totalDuration: TimeInterval { get }

    
    /**
     * @property testDuration
     * The number of seconds that elapsed between when the run was started and when it was stopped.
     */
    open var testDuration: TimeInterval { get }

    
    /**
     * @property testCaseCount
     * The number of tests in the run.
     */
    open var testCaseCount: Int { get }

    
    /**
     * @property executionCount
     * The number of test executions recorded during the run.
     */
    open var executionCount: Int { get }

    
    /**
     * @property failureCount
     * The number of test failures recorded during the run.
     */
    open var failureCount: Int { get }

    
    /**
     * @property unexpectedExceptionCount
     * The number of uncaught exceptions recorded during the run.
     */
    open var unexpectedExceptionCount: Int { get }

    
    /**
     * @property totalFailureCount
     * The total number of test failures and uncaught exceptions recorded during the run.
     */
    open var totalFailureCount: Int { get }

    
    /**
     * @property hasSucceeded
     * YES if all tests in the run completed their execution without recording any failures, otherwise NO.
     */
    open var hasSucceeded: Bool { get }

    
    /**
     * @method -recordFailureWithDescription:inFile:atLine:expected:
     * Records a failure in the execution of the test for this test run. Must not be called
     * unless the run has been started. Must not be called if the test run has been stopped.
     *
     * @param description The description of the failure being reported.
     *
     * @param filePath The file path to the source file where the failure being reported
     * was encountered or nil if unknown.
     *
     * @param lineNumber The line number in the source file at filePath where the
     * failure being reported was encountered.
     *
     * @param expected YES if the failure being reported was the result of a failed assertion,
     * NO if it was the result of an uncaught exception.
     *
     */
    open func recordFailure(withDescription description: String, inFile filePath: String?, atLine lineNumber: Int, expected: Bool)
}
//
// Copyright (c) 2013-2015 Apple Inc. All rights reserved.
//
// Copyright (c) 1997-2005, Sen:te (Sente SA).  All rights reserved.
//
// Use of this source code is governed by the following license:
// 
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
// 
// (1) Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// 
// (2) Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation 
// and/or other materials provided with the distribution.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL Sente SA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// Note: this license is equivalent to the FreeBSD license.
// 
// This notice may not be removed from this file.

open class XCTestCaseRun : XCTestRun {

    
    @available(*, deprecated)
    open func recordFailure(inTest testCase: XCTestCase, withDescription description: String, inFile filePath: String, atLine lineNumber: Int, expected: Bool)
}
//
// Copyright (c) 2013-2015 Apple Inc. All rights reserved.
//
// Copyright (c) 1997-2005, Sen:te (Sente SA).  All rights reserved.
//
// Use of this source code is governed by the following license:
// 
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
// 
// (1) Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// 
// (2) Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation 
// and/or other materials provided with the distribution.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL Sente SA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// Note: this license is equivalent to the FreeBSD license.
// 
// This notice may not be removed from this file.


/**
 * XCTestObserver is deprecated.
 */
@available(*, deprecated)
open class XCTestObserver : NSObject {

    
    open func startObserving()

    open func stopObserving()

    open func testSuiteDidStart(_ testRun: XCTestRun!)

    open func testSuiteDidStop(_ testRun: XCTestRun!)

    open func testCaseDidStart(_ testRun: XCTestRun!)

    open func testCaseDidStop(_ testRun: XCTestRun!)

    open func testCaseDidFail(_ testRun: XCTestRun!, withDescription description: String!, inFile filePath: String!, atLine lineNumber: Int)
}

/**
 * XCTestObserverClassKey is deprecated and ignored.
 */
@available(*, deprecated)
public let XCTestObserverClassKey: String
//
// Copyright (c) 2013-2015 Apple Inc. All rights reserved.
//
// Copyright (c) 1997-2005, Sen:te (Sente SA).  All rights reserved.
//
// Use of this source code is governed by the following license:
// 
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
// 
// (1) Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// 
// (2) Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation 
// and/or other materials provided with the distribution.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL Sente SA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// Note: this license is equivalent to the FreeBSD license.
// 
// This notice may not be removed from this file.

/*!
 * XCTestLog is deprecated.
 */

@available(*, deprecated)
open class XCTestLog : XCTestObserver {

    
    open var logFileHandle: FileHandle! { get }

    
    open func testLog(withFormat format: String!, arguments: CVaListPointer)
}
//
//  Copyright (c) 2014-2015 Apple Inc. All rights reserved.
//

/**
 * @protocol XCTestObservation
 *
 * Objects conforming to XCTestObservation can register to be notified of the progress of test runs. See XCTestObservationCenter
 * for details on registration.
 *
 * Progress events are delivered in the following sequence:
 *
 * -testBundleWillStart:                            // exactly once per test bundle
 *      -testSuiteWillStart:                        // exactly once per test suite
 *          -testCaseWillStart:                     // exactly once per test case
 *          -testCase:didFailWithDescription:...    // zero or more times per test case, any time between test case start and finish
 *          -testCaseDidFinish:                     // exactly once per test case
 *      -testSuite:didFailWithDescription:...       // zero or more times per test suite, any time between test suite start and finish
 *      -testSuiteDidFinish:                        // exactly once per test suite
 * -testBundleDidFinish:                            // exactly once per test bundle
 */
public protocol XCTestObservation : NSObjectProtocol {

    
    /**
     * @method -testBundleWillStart:
     *
     * Sent immediately before tests begin as a hook for any pre-testing setup.
     *
     * @param testBundle The bundle containing the tests that were executed.
     */
    optional func testBundleWillStart(_ testBundle: Bundle)

    
    /**
     * @method -testBundleDidFinish:
     *
     * Sent immediately after all tests have finished as a hook for any post-testing activity. The test process will generally
     * exit after this method returns, so if there is long running and/or asynchronous work to be done after testing, be sure
     * to implement this method in a way that it blocks until all such activity is complete.
     *
     * @param testBundle The bundle containing the tests that were executed.
     */
    optional func testBundleDidFinish(_ testBundle: Bundle)

    
    /**
     * @method -testSuiteWillStart:
     *
     * Sent when a test suite starts executing.
     *
     * @param testSuite The test suite that started. Additional information can be retrieved from the associated XCTestRun.
     */
    optional func testSuiteWillStart(_ testSuite: XCTestSuite)

    
    /**
     * @method -testSuiteDidFail:withDescription:inFile:atLine:
     *
     * Sent when a test suite reports a failure. Suite failures are most commonly reported during suite-level setup and teardown
     * whereas failures during tests are reported for the test case alone and are not reported as suite failures.
     *
     * @param testSuite The test suite that failed. Additional information can be retrieved from the associated XCTestRun.
     * @param description A textual description of the failure.
     * @param filePath The path of file where the failure occurred, nil if unknown.
     * @param lineNumber The line where the failure was reported.
     */
    optional func testSuite(_ testSuite: XCTestSuite, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: Int)

    
    /**
     * @method -testSuiteDidFinish:
     *
     * Sent when a test suite finishes executing.
     *
     * @param testSuite The test suite that finished. Additional information can be retrieved from the associated XCTestRun.
     */
    optional func testSuiteDidFinish(_ testSuite: XCTestSuite)

    
    /**
     * @method -testCaseWillStart:
     *
     * Sent when a test case starts executing.
     *
     * @param testCase The test case that started. Additional information can be retrieved from the associated XCTestRun.
     */
    optional func testCaseWillStart(_ testCase: XCTestCase)

    
    /**
     * @method -testCaseDidFail:withDescription:inFile:atLine:
     *
     * Sent when a test case reports a failure.
     *
     * @param testCase The test case that failed. Additional information can be retrieved from the associated XCTestRun.
     * @param description A textual description of the failure.
     * @param filePath The path of file where the failure occurred, nil if unknown.
     * @param lineNumber The line where the failure was reported.
     */
    optional func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: Int)

    
    /**
     * @method -testCaseDidFinish:
     *
     * Sent when a test case finishes executing.
     *
     * @param testCase The test case that finished. Additional information can be retrieved from the associated XCTestRun.
     */
    optional func testCaseDidFinish(_ testCase: XCTestCase)
}
//
// Copyright (c) 2013-2015 Apple Inc. All rights reserved.
//

/**
 * @class XCTestObservationCenter
 *
 * The XCTestObservationCenter distributes information about the progress of test runs to registered
 * observers. Observers can be any object conforming to the XCTestObservation protocol.
 *
 * If an NSPrincipalClass is declared in the test bundle's Info.plist, XCTest automatically creates a
 * single instance of that class when the test bundle is loaded. This instance provides a means to register
 * observers or do other pretesting global set up.
 *
 * Observers must be registered manually. The NSPrincipalClass instance is not automatically
 * registered as an observer even if the class conforms to <XCTestObservation>.
 */
open class XCTestObservationCenter : NSObject {

    
    /**
     * @property sharedTestObservationCenter
     *
     * @return The shared XCTestObservationCenter singleton instance.
     */
    open class var shared: XCTestObservationCenter { get }

    
    /**
     * @method -addTestObserver:
     *
     * Register an object conforming to XCTestObservation as an observer for the current test session. Observers may be added
     * at any time, but will not receive events that occurred before they were registered. The observation center maintains a strong
     * reference to observers.
     *
     * Events may be delivered to observers in any order - given observers A and B, A may be notified of a test failure before
     * or after B. Any ordering dependencies or serialization requirements must be managed by clients.
     */
    open func addTestObserver(_ testObserver: XCTestObservation)

    
    /**
     * @method -removeTestObserver:
     *
     * Unregister an object conforming to XCTestObservation as an observer for the current test session.
     */
    open func removeTestObserver(_ testObserver: XCTestObservation)
}
//
// Copyright (c) 2013-2015 Apple Inc. All rights reserved.
//
// Copyright (c) 1997-2005, Sen:te (Sente SA).  All rights reserved.
//
// Use of this source code is governed by the following license:
// 
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
// 
// (1) Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// 
// (2) Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation 
// and/or other materials provided with the distribution.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL Sente SA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// Note: this license is equivalent to the FreeBSD license.
// 
// This notice may not be removed from this file.

@available(*, deprecated)
public func XCTSelfTestMain() -> Int32

@available(*, deprecated)
open class XCTestProbe : NSObject {

    
    open class func isTesting() -> Bool
}

@available(*, deprecated)
public let XCTestedUnitPath: String
@available(*, deprecated)
public let XCTestScopeKey: String
@available(*, deprecated)
public let XCTestScopeAll: String
@available(*, deprecated)
public let XCTestScopeNone: String
@available(*, deprecated)
public let XCTestScopeSelf: String
@available(*, deprecated)
public let XCTestToolKey: String
//
// Copyright (c) 2013-2015 Apple Inc. All rights reserved.
//
// Copyright (c) 1997-2005, Sen:te (Sente SA).  All rights reserved.
//
// Use of this source code is governed by the following license:
// 
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
// 
// (1) Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// 
// (2) Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation 
// and/or other materials provided with the distribution.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL Sente SA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// Note: this license is equivalent to the FreeBSD license.
// 
// This notice may not be removed from this file.

/**
 * @class XCTestSuite
 * A concrete subclass of XCTest, XCTestSuite is a collection of test cases. Suites
 * are usually managed by the IDE, but XCTestSuite also provides API for dynamic test
 * and suite management:
 * @textblock

    XCTestSuite *suite = [XCTestSuite testSuiteWithName:@"My tests"];
    [suite addTest:[MathTest testCaseWithSelector:@selector(testAdd)]];
    [suite addTest:[MathTest testCaseWithSelector:@selector(testDivideByZero)]];

 * @/textblock
 * Alternatively, a test suite can extract the tests to be run automatically. To do so,
 * pass the class of your test case class to the suite's constructor:
 * @textblock

    XCTestSuite *suite = [XCTestSuite testSuiteForTestCaseClass:[MathTest class]];

 * @/textblock
 * This creates a suite with all the methods starting with "test" that take no arguments.
 * Also, a test suite of all the test cases found in the runtime can be created automatically:
 * @textblock

    XCTestSuite *suite = XCTestSuite.defaultTestSuite;

 * @/textblock
 * This creates a suite of suites with all the XCTestCase subclasses methods that start
 * with "test" and take no arguments.
 */
open class XCTestSuite : XCTest {

    
    open class var `default`: XCTestSuite { get }

    
    public convenience init(forBundlePath bundlePath: String)

    public convenience init(forTestCaseWithName name: String)

    public convenience init(forTestCaseClass testCaseClass: AnyClass)

    
    public init(name: String)

    
    open func addTest(_ test: XCTest)

    
    open var tests: [XCTest] { get }
}
//
// Copyright (c) 2013-2015 Apple Inc. All rights reserved.
//
// Copyright (c) 1997-2005, Sen:te (Sente SA).  All rights reserved.
//
// Use of this source code is governed by the following license:
// 
// Redistribution and use in source and binary forms, with or without modification, 
// are permitted provided that the following conditions are met:
// 
// (1) Redistributions of source code must retain the above copyright notice, 
// this list of conditions and the following disclaimer.
// 
// (2) Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation 
// and/or other materials provided with the distribution.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL Sente SA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// Note: this license is equivalent to the FreeBSD license.
// 
// This notice may not be removed from this file.

open class XCTestSuiteRun : XCTestRun {

    
    open var testRuns: [XCTestRun] { get }

    
    open func addTestRun(_ testRun: XCTestRun)
}
//
//  Copyright © 2017 Apple. All rights reserved.
//

/**
 * @class XCTAttachment
 * Represents the concept of data attached to an XCTActivity. Allows reporting more context about the test run
 * for debugging, such as screenshots, log files, and configuration dictionaries.
 *
 * Each attachment must be added to an activity to be handed off to XCTest. There are two ways to get an activity:
 * 1. XCTestCase conforms to the XCTActivity protocol, attachments can be added to it directly.
 * 2. Create a nested activity with +[XCTContext runActivityNamed:block:], the parameter inside the block is a new activity to which attachments can be added.
 *
 * Once you have an XCTActivity-conforming object:
 * • Create a new XCTAttachment with one of the initializers provided.
 * • Optionally customize the attachment's `lifetime`, `name` and `userInfo` properties.
 * • Add the attachment to the activity with -[XCTActivity addAttachment:].
 *
 * @textblock
 
    - (void)testFoo
    {
        // ...
        NSString *logs = ...
        XCTAttachment *attachment = [XCTAttachment attachmentWithString:logs];
        attachment.name = @"Build logs";
        [self addAttachment:attachment];
    }

    - (void)testNestedFoo
    {
        // ...
        [XCTContext runActivityNamed:@"Collect logs" block:^(id<XCTActivity> activity){
            NSString *logs = ...
            XCTAttachment *attachment = [XCTAttachment attachmentWithString:logs];
            attachment.name = @"Build logs";
            [activity addAttachment:attachment];
        }];
    }
 
 * @/textblock
 *
 * Attachments have the default lifetime of .deleteOnSuccess, which means they are deleted when
 * their test passes. This ensures attachments are only kept when test fails. To override this
 * behavior, change the value of the `lifetime` property to .keepAlways before adding it to an activity.
 *
 * @textblock
 
     - (void)testImportantAttachment
     {
         XCTAttachment *attachment = ...
         attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
         [self addAttachment:attachment];
     }
 
 * @/textblock
 */
open class XCTAttachment : NSObject, NSSecureCoding {

    
    /**
     * @method -initWithUniformTypeIdentifier:name:payload:userInfo:
     */
    public init(uniformTypeIdentifier identifier: String?, name: String?, payload: Data?, userInfo: [AnyHashable : Any]? = nil)

    
    /**
     * @property uniformTypeIdentifier
     * UTI (Uniform Type Identifier) of the payload data.
     * Examples: "public.png", "public.jpeg", "public.plain-text", "public.data", "com.apple.xml-property-list".
     */
    open var uniformTypeIdentifier: String { get }

    
    /**
     * @property name
     * Attachment name.
     */
    open var name: String?

    
    /**
     * @property userInfo
     * Container for additional metadata, such as pixel density with images.
     */
    open var userInfo: [AnyHashable : Any]?

    
    /*
     * @property lifetime
     * Attachment lifetime. Controls whether the attachment is persisted.
     * @see XCTAttachmentLifetime
     * Default: XCTAttachmentLifetimeDeleteOnSuccess
     */
    open var lifetime: XCTAttachment.Lifetime
}
extension XCTAttachment {

    
    /**
     * @enum XCTImageQuality
     */
    public enum ImageQuality : Int {

        
        case original

        
        case medium

        
        case low
    }

    
    public enum Lifetime : Int {

        
        case keepAlways

        
        case deleteOnSuccess
    }
}

extension XCTAttachment {

    
    /**
     * @method -attachmentWithData:
     * Creates a new data attachment (type "public.data") with the specified payload.
     */
    public convenience init(data payload: Data)

    
    /**
     * @method -attachmentWithData:uniformTypeIdentifier:
     * Creates a new attachment with the specified payload and type.
     */
    public convenience init(data payload: Data, uniformTypeIdentifier identifier: String)

    
    /**
     * @method -attachmentWithString:
     * Creates a new plain UTF-8 encoded text attachment (type "public.plain-text") with the specified string.
     */
    public convenience init(string: String)

    
    /**
     * @method -attachmentWithArchivableObject:
     * Creates an attachment with an object that can be encoded with NSSecureCoding.
     * Defaults to type "public.data".
     */
    public convenience init(archivableObject object: NSSecureCoding)

    
    /**
     * @method -attachmentWithArchivableObject:uniformTypeIdentifier:
     * Creates an attachment with an object that can be encoded with NSSecureCoding and type.
     */
    public convenience init(archivableObject object: NSSecureCoding, uniformTypeIdentifier identifier: String)

    
    /**
     * @method -attachmentWithPlistObject:
     * Creates an attachment with an object that can be encoded into an XML property list.
     */
    public convenience init(plistObject object: Any)

    
    /**
     * @method -attachmentWithContentsOfFileAtURL:
     * Creates an attachment with an existing file on disk. Attachment's UTI is inferred from the file extension.
     * If no type can be inferred from the extension, fallback is "public.data".
     * @note Only works for files, not directories.
     */
    public convenience init(contentsOfFile url: URL)

    
    /**
     * @method -attachmentWithContentsOfFileAtURL:uniformTypeIdentifier:
     * Creates an attachment with an existing file on disk and type.
     * @note Only works for files, not directories.
     */
    public convenience init(contentsOfFile url: URL, uniformTypeIdentifier identifier: String)

    
    /*!
     * @method -attachmentWithCompressedContentsOfDirectoryAtURL:
     * Creates an attachment with an existing directory on disk. Automatically zips the directory, the content type is "public.zip-archive".
     */
    
    /*!
     * @method +attachmentWithImage:
     * Creates an attachment with a platform-specific image class.
     */
    
    public convenience init(image: UIImage)

    
    /*!
     * @method +attachmentWithImage:quality:
     * Creates an attachment with a platform-specific image class and specified quality.
     */
    
    public convenience init(image: UIImage, quality: XCTAttachment.ImageQuality)

    
    /**
     * @method +attachmentWithScreenshot:
     * Creates an attachment with a screenshot and the specified quality.
     */
    public convenience init(screenshot: XCUIScreenshot)

    
    /**
     * @method +attachmentWithScreenshot:quality:
     * Creates an attachment with a screenshot and the specified quality.
     */
    public convenience init(screenshot: XCUIScreenshot, quality: XCTAttachment.ImageQuality)
}
//
//  Copyright © 2017 Apple. All rights reserved.
//

open class XCTContext : NSObject {

    
    /**
     * @method -runActivityNamed:block:
     *
     * Call to create a named activity around the block.
     * Can be used to group low level actions, such as typing and tapping, into high level
     * tasks, such as filling of a form in a UI test.
     * @textblock
     
     - (void)testSignUpFlow {
         XCUIElement *form = ...
         [XCTContext runActivityNamed:@"Fill in account information" block:^{
             [form.textFields[@"Email"] typeText:@"john.appleseed@icloud.com"];
             [form.secureTextFields[@"New Password"] typeText:@"myPassword"];
         }];
         [XCTContext runActivityNamed:@"Create account" block:^{
             XCUIElement *submit = form.buttons[@"Create"];
             XCTAssert(submit.isEnabled);
             [submit tap];
         }];
     }
     
     * @/textblock
     * Such test would result in an activity hierarchy of:
     * @textblock
     
     - Fill in account information
         - Type "john.appleseed@icloud.com" into "Email"
         - Type "myPassword" into "New Password"
     - Create account
         - Tap "Create"
     
     * @/textblock
     *
     * Must be called from the main thread.
     *
     * @param name A string that will help identify the activity.
     *
     * @param block A block whose contents are wrapped in the new activity.
     */
    open class func __runActivityNamed(_ name: String, block: (XCTActivity) -> Void)
}

extension XCTContext {

    /// Create and run a new activity with provided name and block.
    public class func runActivity<Result>(named name: String, block: (XCTActivity) throws -> Result) rethrows -> Result
}
extension XCTDarwinNotificationExpectation {

    
    /**
     * @typedef
     * Handler called when the expectation has received the Darwin notification. If the handler is not
     * provided the first posting of the notification will fulfill the expectation. If provided, the handler
     * will be queried each time the notification is received to determine whether the expectation should
     * be fulfilled or not. This allows the caller to check Darwin state variables or perform other logic
     * beyond simply verifying that the notification has been posted.
     */
    public typealias Handler = () -> Bool
}

/**
 * @class XCTDarwinNotificationExpectation
 * Expectation subclass for waiting on a condition defined by a Darwin notification. The notification
 * which may be posted in the same process or by other processes. Be aware that Darwin notifications
 * may be coalesced when posted in quick succession, so be careful especially when using the
 * `expectedFulfillmentCount` property with this class.
 */
open class XCTDarwinNotificationExpectation : XCTestExpectation {

    
    /**
     * @method -initWithNotificationName:
     *
     * @discussion
     * Initializes an expectation that waits for a Darwin notification to be posted.
     */
    public init(notificationName: String)

    
    /**
     * @property notificationName
     * Returns the value of the notification name that was provided to the initializer.
     */
    open var notificationName: String { get }

    
    /**
     * @property handler
     * Allows the caller to install a special handler to do custom evaluation when the notification is posted.
     */
    open var handler: XCTDarwinNotificationExpectation.Handler?
}
extension XCTMeasureOptions {

    
    /**
     * @enum XCTMeasurementInvocationOptions
     */
    public struct InvocationOptions : OptionSet {

        public init(rawValue: UInt)

        
        public static var manuallyStart: XCTMeasureOptions.InvocationOptions { get }

        
        public static var manuallyStop: XCTMeasureOptions.InvocationOptions { get }
    }
}

/**
 * @class XCTMeasureOptions
 * Collection of options which configures behavior when passed into the -[XCTMeasure measure*] APIs.
 */
open class XCTMeasureOptions : NSObject {

    
    /**
     * @property defaultOptions
     * Builds a set of recommended default options for measuring.
     *
     * @return An object which represents a set of default configuration options for measuring.
     */
    @NSCopying open class var `default`: XCTMeasureOptions { get }

    
    /**
     * @property invocationOptions
     * Set of options which configure how measurements are taken. The default option is XCTMeasurementInvocationNone.
     */
    open var invocationOptions: XCTMeasureOptions.InvocationOptions

    
    /**
     * @property iterationCount
     * The number of times the block being measured should be invoked. The default value is 5.
     * Note that the block is actually invoked `iterationCount` + 1 times, and the first iteration
     * is discarded. This is done to reduce the chance that the first iteration will be an outlier.
     */
    open var iterationCount: Int
}
//
//  Copyright © 2018 Apple Inc. All rights reserved.
//

/**
 * @class XCTPerformanceMeasurementTimestamp
 * Encapsulates timestamps at various levels
 */
open class XCTPerformanceMeasurementTimestamp : NSObject {

    
    /**
     * @property absoluteTime
     * The timestamp recorded using mach_absolute_time().
     */
    open var absoluteTime: UInt64 { get }

    
    /**
     * @property absoluteTimeNanoSeconds
     * Nanoseconds since an arbitrary point, does not increment while the system is asleep.
     */
    open var absoluteTimeNanoSeconds: UInt64 { get }

    
    /**
     * @property date
     * The timestamp recorded using an NSDate.
     */
    open var date: Date { get }

    
    /**
     * @method -initWithAbsoluteTime:date:
     * Initializes an object with the given mach absolute time and NSDate instance.
     */
    public init(absoluteTime: UInt64, date: Date)

    
    /**
     * @method -init
     * Initializes an object which represents a timestamp at the current time.
     */
    public convenience init()
}

/**
 * @class XCTPerformanceMeasurement
 * Contains the data acquired from a single metric being measured for an individual iteration.
 */
open class XCTPerformanceMeasurement : NSObject {

    
    /**
     * @property identifier
     * A unique identifier for this measurement such as "com.apple.XCTPerformanceMetric_WallClockTime".
     */
    open var identifier: String { get }

    
    /**
     * @property displayName
     * The human-readable name for this measurement, such as "Wall Clock Time".
     */
    open var displayName: String { get }

    
    /**
     * @property value
     * The value of the measurement.
     */
    @available(iOS 10.0, *)
    open var value: Measurement<Unit> { get }

    
    /**
     * @property doubleValue
     * The double value of the measurement.
     */
    open var doubleValue: Double { get }

    
    /**
     * @property unitSymbol
     * A string describing the unit the value is in.
     */
    open var unitSymbol: String { get }

    
    /**
     * @method -initWithIdentifier:displayName:value:
     * Initializes an object which encapsulates the measurement for a metric during a single iteration.
     */
    @available(iOS 10.0, *)
    public convenience init(identifier: String, displayName: String, value: Measurement<Unit>)

    
    /**
     * @method -initWithIdentifier:displayName:doubleValue:unitSymbol:
     * Initializes an object which encapsulates the measurement for a metric during a single iteration.
     */
    public init(identifier: String, displayName: String, doubleValue: Double, unitSymbol: String)
}

/**
 * @protocol XCTMetric
 * Defines a protocol which may be used with the -measureWithMetrics* methods on XCTestCase.
 *
 * @discussion
 * Classes conforming to XCTMetric must also adopt NSCopying, as a unique metric instance is copied for each iteration.
 */
public protocol XCTMetric : NSCopying, NSObjectProtocol {

    
    /**
     * @method -reportMeasurementsFromStartTime:toEndTime:error:
     * Report measurements for the iteration that started and ended at the specified times.
     *
     * @discussion
     * Called after -didStopMeasuring has been invoked and when XCTest is ready to gather
     * the measurements that were collected. You can truncate the data accumulated to be as
     * accurate as possible with the start and end times.
     */
    func reportMeasurements(from startTime: XCTPerformanceMeasurementTimestamp, to endTime: XCTPerformanceMeasurementTimestamp) throws -> [XCTPerformanceMeasurement]

    
    /*
     * @method -willBeginMeasuring
     * Called every iteration just before the measure block is about to be invoked.
     * You should begin measuring when this is called.
     */
    optional func willBeginMeasuring()

    
    /*
     * @method -didStopMeasuring
     * Called after the measure block's invocation. You should stop measuring when
     * this is called.
     */
    optional func didStopMeasuring()
}


/**
 * @class XCTClockMetric
 * A metric which gathers monotonic time data.
 */
@available(iOS 13.0, *)
open class XCTClockMetric : NSObject, XCTMetric {

    
    /**
     * @method init
     * Initializes a metric which is recommended for measuring time.
     *
     * @return A new instance of a metric which will measure time.
     *
     */
    public init()
}


/**
 * @class XCTOSSignpostMetric
 * A metric which measures metric and timestamp data gathered from os_signposts.
 */
@available(iOS 13.0, *)
open class XCTOSSignpostMetric : NSObject, XCTMetric {

    
    /**
     * @method -initWithSubsystem:category:name
     * Initializes a metric which describes a custom signpost.
     *
     * @param subsystem The subsystem of the target signpost.
     * @param category The category of the target signpost.
     * @param name The name of the target signpost.
     * @return A signpost metric describing the target signpost.
     */
    public init(subsystem: String, category: String, name: String)
}


/**
 * Interface extension describing OS Signposts that are instrumented by the OS.
 */
@available(iOS 13.0, *)
extension XCTOSSignpostMetric {

    
    /**
     * @property applicationLaunchMetric
     * The XCTOSSignpostMetric object covering application launch
     */
    open class var applicationLaunch: XCTOSSignpostMetric { get }
}


/**
 * @class XCTCPUMetric
 * A metric which measures instructions retired and time utilization of the CPU.
 */
@available(iOS 13.0, *)
open class XCTCPUMetric : NSObject, XCTMetric {

    
    /**
     * @method initLimitingToCurrentThread:
     * Creates a metric which will observe CPU activity for the thread that executes
     * the block being measured. For single-threaded workloads, this provides greater
     * precision and lower variance than -init.
     *
     * @note The Thread under test is defined as the thread which will perform the execution of the work provided to the -[XCTestCase measure*] API.
     *
     * @returns An initialized metric.
     */
    public init(limitingToCurrentThread limitToCurrentThread: Bool)

    
    /**
     * @method init
     * Creates a metric that will target the current process.
     *
     * @returns An initialized metric.
     */
    public init()

    
    /**
     * @method initWithApplication:
     * Creates a metric which will target the process described by the XCUIApplication instance.
     *
     * @param application An instance of XCUIApplication which will be targeted to gather measurements.
     *
     * @return An initialized metric.
     */
    public init(application: XCUIApplication)
}


/**
 * @class XCTMemoryMetric
 * A metric which measures utilization of physical memory.
 */
@available(iOS 13.0, *)
open class XCTMemoryMetric : NSObject, XCTMetric {

    
    /**
     * @method init
     * Creates a metric that will target the current process.
     *
     * @returns An initialized metric.
     */
    public init()

    
    /**
     * @method initWithApplication:
     * Creates a metric which will target the process described by the XCUIApplication instance.
     *
     * @param application An instance of XCUIApplication which will be targeted to gather measurements.
     *
     * @return An initialized metric.
     */
    public init(application: XCUIApplication)
}


/**
 * @class XCTStorageMetric
 * A metric which measures utilization of the file storage media.
 */
@available(iOS 13.0, *)
open class XCTStorageMetric : NSObject, XCTMetric {

    
    /**
     * @method init
     * Creates a metric that will target the current process.
     *
     * @returns An initialized metric.
     */
    public init()

    
    /**
     * @method initWithApplication:
     * Creates a metric which will target the process described by the XCUIApplication instance.
     *
     * @param application An instance of XCUIApplication which will be targeted to gather measurements.
     *
     * @return An initialized metric.
     */
    public init(application: XCUIApplication)
}
extension XCUIElement {

    
    @available(iOS 9.0, *)
    public enum ElementType : UInt {

        
        case any

        case other

        case application

        case group

        case window

        case sheet

        case drawer

        case alert

        case dialog

        case button

        case radioButton

        case radioGroup

        case checkBox

        case disclosureTriangle

        case popUpButton

        case comboBox

        case menuButton

        case toolbarButton

        case popover

        case keyboard

        case key

        case navigationBar

        case tabBar

        case tabGroup

        case toolbar

        case statusBar

        case table

        case tableRow

        case tableColumn

        case outline

        case outlineRow

        case browser

        case collectionView

        case slider

        case pageIndicator

        case progressIndicator

        case activityIndicator

        case segmentedControl

        case picker

        case pickerWheel

        case `switch`

        case toggle

        case link

        case image

        case icon

        case searchField

        case scrollView

        case scrollBar

        case staticText

        case textField

        case secureTextField

        case datePicker

        case textView

        case menu

        case menuItem

        case menuBar

        case menuBarItem

        case map

        case webView

        case incrementArrow

        case decrementArrow

        case timeline

        case ratingIndicator

        case valueIndicator

        case splitGroup

        case splitter

        case relevanceIndicator

        case colorWell

        case helpTag

        case matte

        case dockItem

        case ruler

        case rulerMarker

        case grid

        case levelIndicator

        case cell

        case layoutArea

        case layoutItem

        case handle

        case stepper

        case tab

        case touchBar

        case statusItem
    }

    //
    //  Copyright (c) 2015 Apple Inc. All rights reserved.
    //
    
    public enum SizeClass : Int {

        
        case unspecified

        case compact

        case regular
    }

    
    /*! Protocol describing the attributes exposed on user interface elements and available during query matching. These attributes represent data exposed to the Accessibility system. */
    
    /*! The accessibility identifier. */
    
    /*! The frame of the element in the screen coordinate space. */
    
    /*! The raw value attribute of the element. Depending on the element, the actual type can vary. */
    
    /*! The title attribute of the element. */
    
    /*! The label attribute of the element. */
    
    /*! The type of the element. /seealso XCUIElementType. */
    
    /*! Whether or not the element is enabled for user interaction. */
    
    /*! The horizontal size class of the element. */
    
    /*! The vertical size class of the element. */
    
    /*! The value that is displayed when the element has no value. */
    
    /*! Whether or not the element is selected. */
    
    /*! Whether or not the elment has UI focus. */
    
    /**
     * @enum Constants for use with APIs that accept or return objects with element attributes specified,
     * such as the dictionaries returned by XCUIElement.dictionaryRepresentation.
     */
    public struct AttributeName : Hashable, Equatable, RawRepresentable {

        public init(rawValue: String)
    }

    //
    //  Copyright (c) 2014-2016 Apple Inc. All rights reserved.
    //
    
    @available(iOS 9.0, *)
    public struct KeyModifierFlags : OptionSet {

        public init(rawValue: UInt)

        
        // These values align with NSEventModifierFlags.
        public static var capsLock: XCUIElement.KeyModifierFlags { get }

        public static var shift: XCUIElement.KeyModifierFlags { get }

        public static var control: XCUIElement.KeyModifierFlags { get }

        public static var option: XCUIElement.KeyModifierFlags { get }

        public static var command: XCUIElement.KeyModifierFlags { get }

        
        // These values align with UIKeyModifierFlags and CGEventFlags.
        public static var alphaShift: XCUIElement.KeyModifierFlags { get }

        public static var alternate: XCUIElement.KeyModifierFlags { get }
    }
}
/** Protocol describing the attributes exposed on user interface elements and available during query matching. These attributes represent data exposed to the Accessibility system. */
@available(iOS 9.0, *)
public protocol XCUIElementAttributes {

    /** The accessibility identifier. */
    var identifier: String { get }

    /** The frame of the element in the screen coordinate space. */
    var frame: CGRect { get }

    /** The raw value attribute of the element. Depending on the element, the actual type can vary. */
    var value: Any? { get }

    /** The title attribute of the element. */
    var title: String { get }

    /** The label attribute of the element. */
    var label: String { get }

    /** The type of the element. /seealso XCUIElementType. */
    var elementType: XCUIElement.ElementType { get }

    /** Whether or not the element is enabled for user interaction. */
    var isEnabled: Bool { get }

    /** The horizontal size class of the element. */
    var horizontalSizeClass: XCUIElement.SizeClass { get }

    /** The vertical size class of the element. */
    var verticalSizeClass: XCUIElement.SizeClass { get }

    /** The value that is displayed when the element has no value. */
    var placeholderValue: String? { get }

    /** Whether or not the element is selected. */
    var isSelected: Bool { get }
}
extension XCUIElement.AttributeName {

    
    /// An array of the element's children.
    public static let children: XCUIElement.AttributeName

    /// The element's type, an NSNumber-wrapped XCUIElementType.
    public static let elementType: XCUIElement.AttributeName

    /// The element's accessibility identifier.
    public static let identifier: XCUIElement.AttributeName

    /// The element's accessibility value, an NSString or NSNumber.
    public static let value: XCUIElement.AttributeName

    /// The element's placeholder value.
    public static let placeholderValue: XCUIElement.AttributeName

    /// The element's title.
    public static let title: XCUIElement.AttributeName

    /// The element's label.
    public static let label: XCUIElement.AttributeName

    /// A dictionary representation of the element's frame, as returned by CGRectCreateDictionaryRepresentation.
    public static let frame: XCUIElement.AttributeName

    /// True if the element is enabled, false otherwise, an NSNumber-wrapped BOOL.
    public static let enabled: XCUIElement.AttributeName

    /// True if the element is selected, false otherwise, an NSNumber-wrapped BOOL.
    public static let selected: XCUIElement.AttributeName

    /// True if the element is focused, false otherwise, an NSNumber-wrapped BOOL.
    public static let hasFocus: XCUIElement.AttributeName

    /// The element's horizontal size class, an NSNumber-wrapped XCUIUserInterfaceSizeClass.
    public static let horizontalSizeClass: XCUIElement.AttributeName

    /// The element's vertical size class, an NSNumber-wrapped XCUIUserInterfaceSizeClass.
    public static let verticalSizeClass: XCUIElement.AttributeName
}
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

public protocol XCUIElementTypeQueryProvider {

    
    @available(iOS 9.0, *)
    @NSCopying var touchBars: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var groups: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var windows: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var sheets: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var drawers: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var alerts: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var dialogs: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var buttons: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var radioButtons: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var radioGroups: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var checkBoxes: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var disclosureTriangles: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var popUpButtons: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var comboBoxes: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var menuButtons: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var toolbarButtons: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var popovers: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var keyboards: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var keys: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var navigationBars: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var tabBars: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var tabGroups: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var toolbars: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var statusBars: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var tables: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var tableRows: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var tableColumns: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var outlines: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var outlineRows: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var disclosedChildRows: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var browsers: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var collectionViews: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var sliders: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var pageIndicators: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var progressIndicators: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var activityIndicators: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var segmentedControls: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var pickers: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var pickerWheels: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var switches: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var toggles: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var links: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var images: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var icons: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var searchFields: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var scrollViews: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var scrollBars: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var staticTexts: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var textFields: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var secureTextFields: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var datePickers: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var textViews: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var menus: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var menuItems: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var menuBars: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var menuBarItems: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var maps: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var webViews: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var steppers: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var incrementArrows: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var decrementArrows: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var tabs: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var timelines: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var ratingIndicators: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var valueIndicators: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var splitGroups: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var splitters: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var relevanceIndicators: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var colorWells: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var helpTags: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var mattes: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var dockItems: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var rulers: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var rulerMarkers: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var grids: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var levelIndicators: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var cells: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var layoutAreas: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var layoutItems: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var handles: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var otherElements: XCUIElementQuery { get }

    @available(iOS 9.0, *)
    @NSCopying var statusItems: XCUIElementQuery { get }

    
    /**
     * Returns an element that will use the query for resolution. This changes how the query is resolved
     * at runtime; instead of evaluating against every element in the user interface, `firstMatch` stops
     * the search as soon as a single matching element is found. This can result in significantly faster
     * evaluation if the element is located early in a large view hierarchy but also means that multiple
     * matches will not be detected.
     */
    @available(iOS 9.0, *)
    var firstMatch: XCUIElement { get }
}
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//


/**
    Constants for use with -[XCUIElement typeKey:modifierFlags:],
    representing keys that have no textual representation. These comprise
    the set of control, function, and modifier keys found on most keyboards.
*/
public struct XCUIKeyboardKey : Hashable, Equatable, RawRepresentable {

    public init(_ rawValue: String)

    public init(rawValue: String)
}
extension XCUIKeyboardKey {

    
    public static let delete: XCUIKeyboardKey

    public static let `return`: XCUIKeyboardKey

    public static let enter: XCUIKeyboardKey

    public static let tab: XCUIKeyboardKey

    public static let space: XCUIKeyboardKey

    public static let escape: XCUIKeyboardKey

    
    public static let upArrow: XCUIKeyboardKey

    public static let downArrow: XCUIKeyboardKey

    public static let leftArrow: XCUIKeyboardKey

    public static let rightArrow: XCUIKeyboardKey

    
    public static let F1: XCUIKeyboardKey

    public static let F2: XCUIKeyboardKey

    public static let F3: XCUIKeyboardKey

    public static let F4: XCUIKeyboardKey

    public static let F5: XCUIKeyboardKey

    public static let F6: XCUIKeyboardKey

    public static let F7: XCUIKeyboardKey

    public static let F8: XCUIKeyboardKey

    public static let F9: XCUIKeyboardKey

    public static let F10: XCUIKeyboardKey

    public static let F11: XCUIKeyboardKey

    public static let F12: XCUIKeyboardKey

    public static let F13: XCUIKeyboardKey

    public static let F14: XCUIKeyboardKey

    public static let F15: XCUIKeyboardKey

    public static let F16: XCUIKeyboardKey

    public static let F17: XCUIKeyboardKey

    public static let F18: XCUIKeyboardKey

    public static let F19: XCUIKeyboardKey

    
    public static let forwardDelete: XCUIKeyboardKey

    public static let home: XCUIKeyboardKey

    public static let end: XCUIKeyboardKey

    public static let pageUp: XCUIKeyboardKey

    public static let pageDown: XCUIKeyboardKey

    public static let clear: XCUIKeyboardKey

    public static let help: XCUIKeyboardKey

    
    public static let capsLock: XCUIKeyboardKey

    public static let shift: XCUIKeyboardKey

    public static let control: XCUIKeyboardKey

    public static let option: XCUIKeyboardKey

    public static let command: XCUIKeyboardKey

    public static let rightShift: XCUIKeyboardKey

    public static let rightControl: XCUIKeyboardKey

    public static let rightOption: XCUIKeyboardKey

    public static let rightCommand: XCUIKeyboardKey

    public static let secondaryFn: XCUIKeyboardKey
}
//
//  Copyright © 2017 Apple. All rights reserved.
//

/**
 * Represents a captured screenshot.
 */
open class XCUIScreenshot : NSObject {

    
    /*!
     * @property image
     * Underlying platform-specific image object.
     */
    
    @NSCopying open var image: UIImage { get }

    
    /**
     * @property PNGRepresentation
     * PNG image data of the underlying image.
     */
    open var pngRepresentation: Data { get }
}
//
//  Copyright © 2017 Apple. All rights reserved.
//

public protocol XCUIScreenshotProviding : NSObjectProtocol {

    
    /**
     * Captures and returns a screenshot of the receiver.
     *
     * Equivalent to capturing a screenshot manually, e.g. if two windows are overlapping and
     * the occluded window is captured, the front window will be visible in the screenshot.
     */
    func screenshot() -> XCUIScreenshot
}


/**
 * @class XCUIElement (/seealso XCUIElementAttributes)
 * Elements are objects encapsulating the information needed to dynamically locate a user interface
 * element in an application. Elements are described in terms of queries /seealso XCUIElementQuery.
 */
@available(iOS 9.0, *)
open class XCUIElement : NSObject, XCUIElementAttributes, XCUIElementTypeQueryProvider {

    
    /** Test to determine if the element exists. */
    open var exists: Bool { get }

    
    /** Waits the specified amount of time for the element's exist property to be true and returns false if the timeout expires without the element coming into existence. */
    open func waitForExistence(timeout: TimeInterval) -> Bool

    
    /** Whether or not a hit point can be computed for the element for the purpose of synthesizing events. */
    open var isHittable: Bool { get }

    
    /** Returns a query for all descendants of the element matching the specified type. */
    open func descendants(matching type: XCUIElement.ElementType) -> XCUIElementQuery

    
    /** Returns a query for direct children of the element matching the specified type. */
    open func children(matching type: XCUIElement.ElementType) -> XCUIElementQuery

    
    /** Creates and returns a new coordinate that will compute its screen point by adding the offset multiplied by the size of the element’s frame to the origin of the element’s frame. */
    open func coordinate(withNormalizedOffset normalizedOffset: CGVector) -> XCUICoordinate

    
    /**
     @discussion
     Provides debugging information about the element. The data in the string will vary based on the
     time at which it is captured, but it may include any of the following as well as additional data:
        • Values for the elements attributes.
        • The entire tree of descendants rooted at the element.
        • The element's query.
     This data should be used for debugging only - depending on any of the data as part of a test is unsupported.
     */
    open var debugDescription: String { get }
}

extension XCUIElement : XCUIScreenshotProviding {
}

/**
 * @category Events
 * Events that can be synthesized relative to an XCUIElement object. When an event API is called, the element
 * will be resolved. If zero or multiple matches are found, an error will be raised.
 */
extension XCUIElement {

    
    /**
     * Types a string into the element. The element or a descendant must have keyboard focus; otherwise an
     * error is raised.
     *
     * This API discards any modifiers set in the current context by +performWithKeyModifiers:block: so that
     * it strictly interprets the provided text. To input keys with modifier flags, use  -typeKey:modifierFlags:.
     */
    open func typeText(_ text: String)
}

/*!
 * Hold modifier keys while the given block runs. This method pushes and pops the modifiers as global state
 * without need for reference to a particular element. Inside the block, elements can be clicked on, dragged
 * from, typed into, etc.
 */

/*!
 * Types a single key with the specified modifier flags. Although `key` is a string, it must represent
 * a single key on a physical keyboard; strings that resolve to multiple keys will raise an error at runtime.
 * In addition to literal string key representations like "a", "6", and "[", keys such as the arrow keys,
 * command, control, option, and function keys can be typed using constants defined for them in XCUIKeyboardKeys.h
 */

// TARGET_OS_OSX || TARGET_OS_MACCATALYST

extension XCUIElement {

    
    /**
     * Sends a tap event to a hittable point computed for the element.
     */
    open func tap()

    
    /**
     * Sends a double tap event to a hittable point computed for the element.
     */
    open func doubleTap()

    
    /**
     * Sends a long press gesture to a hittable point computed for the element, holding for the specified duration.
     *
     * @param duration
     * Duration in seconds.
     */
    open func press(forDuration duration: TimeInterval)

    
    /**
     * Initiates a press-and-hold gesture that then drags to another element, suitable for table cell reordering and similar operations.
     * @param duration
     * Duration of the initial press-and-hold.
     * @param otherElement
     * The element to finish the drag gesture over. In the example of table cell reordering, this would be the reorder element of the destination row.
     */
    open func press(forDuration duration: TimeInterval, thenDragTo otherElement: XCUIElement)

    
    // TARGET_OS_OSX || TARGET_OS_IOS
    
    /**
     * Sends a two finger tap event to a hittable point computed for the element.
     */
    open func twoFingerTap()

    
    /**
     * Sends one or more taps with one of more touch points.
     *
     * @param numberOfTaps
     * The number of taps.
     *
     * @param numberOfTouches
     * The number of touch points.
     */
    open func tap(withNumberOfTaps numberOfTaps: Int, numberOfTouches: Int)

    
    /**
     * Sends a swipe-up gesture.
     */
    open func swipeUp()

    
    /**
     * Sends a swipe-down gesture.
     */
    open func swipeDown()

    
    /**
     * Sends a swipe-left gesture.
     */
    open func swipeLeft()

    
    /**
     * Sends a swipe-right gesture.
     */
    open func swipeRight()

    
    /**
     * Sends a pinching gesture with two touches.
     *
     * The system makes a best effort to synthesize the requested scale and velocity: absolute accuracy is not guaranteed.
     * Some values may not be possible based on the size of the element's frame - these will result in test failures.
     *
     * @param scale
     * The scale of the pinch gesture.  Use a scale between 0 and 1 to "pinch close" or zoom out and a scale greater than 1 to "pinch open" or zoom in.
     *
     * @param velocity
     * The velocity of the pinch in scale factor per second.
     */
    open func pinch(withScale scale: CGFloat, velocity: CGFloat)

    
    /**
     * Sends a rotation gesture with two touches.
     *
     * The system makes a best effort to synthesize the requested rotation and velocity: absolute accuracy is not guaranteed.
     * Some values may not be possible based on the size of the element's frame - these will result in test failures.
     *
     * @param rotation
     * The rotation of the gesture in radians.
     *
     * @param velocity
     * The velocity of the rotation gesture in radians per second.
     */
    open func rotate(_ rotation: CGFloat, withVelocity velocity: CGFloat)
}

// TARGET_OS_IOS && !TARGET_OS_MACCATALYST

/*!
 * Moves the cursor over the element.
 */

/*!
 * Sends a click event to a hittable point computed for the element.
 */

/*!
 * Sends a double click event to a hittable point computed for the element.
 */

/*!
 * Sends a right click event to a hittable point computed for the element.
 */

/*!
 * Clicks and holds for a specified duration (generally long enough to start a drag operation) then drags
 * to the other element.
 */

/*!
 * Scroll the view the specified pixels, x and y.
 */

// TARGET_OS_OSX || TARGET_OS_MACCATALYST

/** This category on XCUIElement provides functionality for automating UISlider and NSSlider. */
extension XCUIElement {

    
    /** Manipulates the UI to change the displayed value of the slider to one based on a normalized position. 0 corresponds to the minimum value of the slider, 1 corresponds to its maximum value. The adjustment is a "best effort" to move the indicator to the desired position; absolute fidelity is not guaranteed. */
    open func adjust(toNormalizedSliderPosition normalizedSliderPosition: CGFloat)

    
    /** Returns the position of the slider's indicator as a normalized value where 0 corresponds to the minimum value of the slider and 1 corresponds to its maximum value. */
    open var normalizedSliderPosition: CGFloat { get }
}

/** This category on XCUIElement provides functionality for automating the picker wheels of UIPickerViews and UIDatePickers. */
extension XCUIElement {

    
    /** Changes the displayed value for the picker wheel. Will generate a test failure if the specified value is not available. */
    open func adjust(toPickerWheelValue pickerWheelValue: String)
}

// TARGET_OS_IOS

public protocol XCUIElementSnapshot : XCUIElementAttributes {

    
    var children: [XCUIElementSnapshot] { get }

    
    /**
     * Returns a hierarchical dictionary representation with standard attributes for the element and all
     * of its descendants. The dictionary keys are of type XCUIElementAttributeName. If the value for a given
     * attribute is null, the key will not be present, but empty strings may be found in the dictionary.
     */
    @available(iOS 9.0, *)
    var dictionaryRepresentation: [XCUIElement.AttributeName : Any] { get }
}

public protocol XCUIElementSnapshotProviding : NSObjectProtocol {

    
    /**
     * Returns a hierarchical data structure with standard attributes for the element and its children.
     */
    func snapshot() throws -> XCUIElementSnapshot
}

extension XCUIElement : XCUIElementSnapshotProviding {
}
extension XCUIApplication {

    
    public enum State : UInt {

        
        case unknown

        case notRunning

        
        case runningBackgroundSuspended

        
        case runningBackground

        case runningForeground
    }
}

/** Proxy for an application that may or may not be running. */
@available(iOS 9.0, *)
open class XCUIApplication : XCUIElement {

    
    /**
     * Returns a proxy for the application specified by the "Target Application" target setting.
     */
    public init()

    
    /**
     * Returns a proxy for an application associated with the specified bundle identifier.
     */
    public init(bundleIdentifier: String)

    
    /*!
     * Returns a proxy for the application at the specified file system URL.
     */
    
    /**
     * Launches the application synchronously. On return the application ready to handle events. If the
     * application is already running, the existing instance will be terminated to ensure a clean state
     * for the launched instance.
     *
     * Any failure in the launch sequence will be reported as a test failure and the test will be halted
     * at that point.
    */
    open func launch()

    
    /**
     * Activates the application synchronously. On return the application is ready to handle events.
     * If the application was not running prior, it will be launched automatically. If the application
     * would be launched as a result of this method and was previously launched via -launch, the launch
     * arguments and environment variables that were used then will be supplied again for the new launch.
     *
     * Unlike -launch, if the application is already running this call will not terminate the existing
     * instance.
     *
     * Any failure in the activation or launch sequence will be reported as a test failure and the test
     * will be halted at that point.
    */
    open func activate()

    
    /**
     * Terminates any running instance of the application. If the application has an existing debug session
     * via Xcode, the termination is implemented as a halt via that debug connection. Otherwise, a SIGKILL
     * is sent to the process.
     */
    open func terminate()

    
    /**
     * The arguments that will be passed to the application on launch. If not modified, these are the
     * arguments that Xcode will pass on launch. Those arguments can be changed, added to, or removed.
     * Unlike NSTask, it is legal to modify these arguments after the application has been launched. These
     * changes will not affect the current launch session, but will take effect the next time the application
     * is launched.
     */
    open var launchArguments: [String]

    
    /**
     * The environment that will be passed to the application on launch. If not modified, this is the
     * environment that Xcode will pass on launch. Those variables can be changed, added to, or removed.
     * Unlike NSTask, it is legal to modify the environment after the application has been launched. These
     * changes will not affect the current launch session, but will take effect the next time the application
     * is launched.
     */
    open var launchEnvironment: [String : String]

    
    /**
     * The most recently observed state of the application. Applications are passively monitored to update
     * this property as they change state. Consequently, updates to this property are inherently asynchronous.
     *
     * Some guarantees are made, however:
     *
     *    - When -launch and -activate return, if they were successful, the state of the application will be
     *      XCUIApplicationStateRunningBackground or XCUIApplicationStateRunningForeground, whichever is
     *      appropriate for the application. Most applications will be XCUIApplicationStateRunningForeground
     *      after launch or activation.
     *
     *    - When -terminate returns, if it was successful, the state of the application will be
     *      XCUIApplicationStateNotRunning.
     */
    open var state: XCUIApplication.State { get }

    
    /**
     * Waits for the application to become a specific state, giving up after a number of seconds.
     *
     * Returns YES if the application is currently in or transitions to the desired state within the specified
     * timeout period.
     */
    open func wait(for state: XCUIApplication.State, timeout: TimeInterval) -> Bool
}
//
//  Copyright © 2017 Apple Inc. All rights reserved.
//


/**
 * @class XCUISiriService
 * Represents a device's Siri interface and allows issuing textual queries
 * and producing element queries for UI shown by Siri.
 */
@available(iOS 10.3, *)
open class XCUISiriService : NSObject {

    
    /**
     * Provides debugging information about the element representing the root of the Siri UI.
     * @seealso XCUIElement
     */
    open var debugDescription: String { get }

    
    /**
     * Presents the Siri UI, if it is not currently active, and accepts a string
     * which is then processed as if it were recognized speech.
     *
     * @param text The string to pass to Siri for processing.
     */
    open func activate(voiceRecognitionText text: String)
}

extension XCUISiriService : XCUIElementTypeQueryProvider {
}
extension XCUIDevice {

    
    /**
     * @enum XCUIDeviceButton
     *
     * Represents a physical button on a device.
     *
     * @note Some buttons are not available in the Simulator, and should not be used in your tests.
     * You can use a block like this:
     *
     *     #if !TARGET_OS_SIMULATOR
     *     // test code that depends on buttons not available in the Simulator
     *     #endif
     *
     * in your test code to ensure it does not call unavailable APIs.
     */
    public enum Button : Int {

        
        case home
    }
}


/** Represents a device, providing an interface for simulating events involving physical buttons and device state. */
@available(iOS 9.0, *)
open class XCUIDevice : NSObject {

    
    /** The current device. */
    open class var shared: XCUIDevice { get }

    
    @available(iOS, introduced: 9.0, deprecated: 9.0)
    public init()

    
    /** The orientation of the device. */
    open var orientation: UIDeviceOrientation

    
    /**
     * Provides access to an object representing the Siri interface on the device.
     */
    @available(iOS 10.3, *)
    open var siriService: XCUISiriService { get }

    
    /** Simulates the user pressing a physical button. */
    open func press(_ button: XCUIDevice.Button)
}
//
//  Copyright (c) 2014-2015 Apple Inc. All rights reserved.
//

/** A coordinate represents a location on screen, relative to some element. Coordinates are dynamic, just like the elements to which they refer, and may compute different screen locations at different times, or be invalid if the referenced element does not exist. */
@available(iOS 9.0, *)
open class XCUICoordinate : NSObject, NSCopying {

    
    /** The element that the coordinate is based on, either directly or via the coordinate from which it was derived. */
    open var referencedElement: XCUIElement { get }

    
    /** The dynamically computed value of the coordinate's location on screen. Note that this value is dependent on the current frame of the referenced element; if the element's frame changes, so will the value returned by this property. If the referenced element does exist when this is called, it will fail the test; check the referenced element's exists property if the element may not be present. */
    open var screenPoint: CGPoint { get }

    
    /** Creates a new coordinate with an absolute offset in points from the original coordinate. */
    open func withOffset(_ offsetVector: CGVector) -> XCUICoordinate
}

extension XCUICoordinate {

    
    open func tap()

    open func doubleTap()

    open func press(forDuration duration: TimeInterval)

    open func press(forDuration duration: TimeInterval, thenDragTo otherCoordinate: XCUICoordinate)
}
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

public let XCUIIdentifierCloseWindow: String
public let XCUIIdentifierMinimizeWindow: String
public let XCUIIdentifierZoomWindow: String
public let XCUIIdentifierFullScreenWindow: String


/** Object for locating elements that can be chained with other queries. */
@available(iOS 9.0, *)
open class XCUIElementQuery : NSObject, XCUIElementTypeQueryProvider {

    
    /** Returns an element that will use the query for resolution. */
    open var element: XCUIElement { get }

    
    /** Evaluates the query at the time it is called and returns the number of matches found. */
    open var count: Int { get }

    
    /** Returns an element that will resolve to the index into the query's result set. */
    @available(iOS, introduced: 9.0, deprecated: 9.0, message: "Use elementBoundByIndex instead.")
    open func element(at index: Int) -> XCUIElement

    
    /** Returns an element that will use the index into the query's results to determine which underlying accessibility element it is matched with. */
    open func element(boundBy index: Int) -> XCUIElement

    
    /** Returns an element that matches the predicate. The predicate will be evaluated against objects of type id<XCUIElementAttributes>. */
    open func element(matching predicate: NSPredicate) -> XCUIElement

    
    /** Returns an element that matches the type and identifier. */
    open func element(matching elementType: XCUIElement.ElementType, identifier: String?) -> XCUIElement

    
    /** Keyed subscripting is implemented as a shortcut for matching an identifier only. For example, app.descendants["Foo"] -> XCUIElement. */
    open subscript(key: String) -> XCUIElement { get }

    
    /** Immediately evaluates the query and returns an array of elements bound to the resulting accessibility elements. */
    open var allElementsBoundByAccessibilityElement: [XCUIElement] { get }

    
    /** Immediately evaluates the query and returns an array of elements bound by the index of each result. */
    open var allElementsBoundByIndex: [XCUIElement] { get }

    
    /** Returns a new query that finds the descendants of all the elements found by the receiver. */
    open func descendants(matching type: XCUIElement.ElementType) -> XCUIElementQuery

    
    /** Returns a new query that finds the direct children of all the elements found by the receiver. */
    open func children(matching type: XCUIElement.ElementType) -> XCUIElementQuery

    
    /** Returns a new query that applies the specified attributes or predicate to the receiver. The predicate will be evaluated against objects of type id<XCUIElementAttributes>. */
    open func matching(_ predicate: NSPredicate) -> XCUIElementQuery

    open func matching(_ elementType: XCUIElement.ElementType, identifier: String?) -> XCUIElementQuery

    open func matching(identifier: String) -> XCUIElementQuery

    
    /** Returns a new query for finding elements that contain a descendant matching the specification. The predicate will be evaluated against objects of type id<XCUIElementAttributes>. */
    open func containing(_ predicate: NSPredicate) -> XCUIElementQuery

    open func containing(_ elementType: XCUIElement.ElementType, identifier: String?) -> XCUIElementQuery

    
    /**
     @discussion
     Provides debugging information about the query. The data in the string will vary based on the time
     at which it is captured, but it may include any of the following as well as additional data:
        • A description of each step of the query.
        • Information about the inputs and matched outputs of each step of the query.
     This data should be used for debugging only - depending on any of the data as part of a test is unsupported.
     */
    open var debugDescription: String { get }
}
//
//  Copyright (c) 2014-2015 Apple Inc. All rights reserved.
//

/**
 * @enum XCUIRemoteButton
 *
 * A button on a physical remote control.
 */
public enum XCUIRemoteButton : UInt {

    
    case up

    case down

    case left

    case right

    
    case select

    case menu

    case playPause

    
    case home
}
//
//  Copyright © 2017 Apple. All rights reserved.
//


/**
 * Represents an active screen of a device. One screen of each device is designated
 * as the "main" screen, on macOS that is the one owning the menu bar, on other platforms
 * it is the primary screen of the device.
 *
 * A screen can be asked for a screenshot using the methods declared in XCUIScreenshotProviding.
 */
@available(iOS 9.0, *)
open class XCUIScreen : NSObject, XCUIScreenshotProviding {

    
    /**
     * Returns the current device's main screen.
     */
    open class var main: XCUIScreen { get }

    
    /**
     * Returns the list of active screens.
     * The first screen returned in the list is the main screen.
     */
    open class var screens: [XCUIScreen] { get }
}
public func XCTAssert(_ expression: @autoclosure () throws -> Bool, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line)

public func XCTAssertEqual<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T : Equatable

public func XCTAssertEqual<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, accuracy: T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T : FloatingPoint

@available(*, deprecated, renamed: "XCTAssertEqual(_:_:accuracy:file:line:)")
public func XCTAssertEqualWithAccuracy<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, accuracy: T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T : FloatingPoint

public func XCTAssertFalse(_ expression: @autoclosure () throws -> Bool, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line)

public func XCTAssertGreaterThan<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T : Comparable

public func XCTAssertGreaterThanOrEqual<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T : Comparable

public func XCTAssertLessThan<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T : Comparable

public func XCTAssertLessThanOrEqual<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T : Comparable

public func XCTAssertNil(_ expression: @autoclosure () throws -> Any?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line)

public func XCTAssertNoThrow<T>(_ expression: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line)

public func XCTAssertNotEqual<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T : Equatable

public func XCTAssertNotEqual<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, accuracy: T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T : FloatingPoint

@available(*, deprecated, renamed: "XCTAssertNotEqual(_:_:accuracy:file:line:)")
public func XCTAssertNotEqualWithAccuracy<T>(_ expression1: @autoclosure () throws -> T, _ expression2: @autoclosure () throws -> T, _ accuracy: T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) where T : FloatingPoint

public func XCTAssertNotNil(_ expression: @autoclosure () throws -> Any?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line)

public func XCTAssertThrowsError<T>(_ expression: @autoclosure () throws -> T, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line, _ errorHandler: (Error) -> Void = { _ in })

public func XCTAssertTrue(_ expression: @autoclosure () throws -> Bool, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line)

public func XCTFail(_ message: String = "", file: StaticString = #file, line: UInt = #line)

/// Asserts that an expression is not `nil`, and returns its unwrapped value.
///
/// Generates a failure when `expression == nil`.
///
/// - Parameters:
///   - expression: An expression of type `T?` to compare against `nil`. Its type will determine the type of the returned value.
///   - message: An optional description of the failure.
///   - file: The file in which failure occurred. Defaults to the file name of the test case in which this function was called.
///   - line: The line number on which failure occurred. Defaults to the line number on which this function was called.
/// - Returns: A value of type `T`, the result of evaluating and unwrapping the given `expression`.
/// - Throws: An error when `expression == nil`. It will also rethrow any error thrown while evaluating the given expression.
public func XCTUnwrap<T>(_ expression: @autoclosure () throws -> T?, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) throws -> T

extension XCTContext {

    /// Create and run a new activity with provided name and block.
    public class func runActivity<Result>(named name: String, block: (XCTActivity) throws -> Result) rethrows -> Result
}

#  <#Title#>

