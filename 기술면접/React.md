### ⚛️ React 기술 면접 질문 & 답변 50선

#### 📚 Part 1: React 기초 (1-10)

**1. React란 무엇이며, 다른 프레임워크와 비교했을 때 가장 큰 특징은 무엇인가요?**
*   **핵심 답변:** React는 사용자 인터페이스(UI)를 구축하기 위한 JavaScript **라이브러리**입니다. 가장 큰 특징은 <b>가상돔(Virtual DOM)</b>을 사용한 빠른 렌더링 성능과, 재사용 가능한 **컴포넌트 기반 아키텍처**입니다. Angular와 같은 프레임워크가 모든 것을 제공하는 '풀 패키지'라면, React는 UI 렌더링에만 집중하고 라우팅이나 상태 관리는 다른 라이브러리(React Router, Redux 등)와 조합하여 사용하는 유연성을 가집니다.

**2. 가상돔(Virtual DOM)의 개념과, 이것이 어떻게 작동하여 성능을 향상시키는지 설명해주세요.**
*   **핵심 답변:** 가상돔은 실제 DOM을 메모리에 복사해 놓은 가상의 JavaScript 객체입니다. 상태가 변경되면 React는 새로운 가상돔 트리를 만들고, 이전 가상돔 트리와 비교하여(이 과정을 **Diffing**이라고 합니다) 변경된 부분만 찾아냅니다. 그리고 이 변경 사항들을 모아서 실제 DOM에 **한 번만** 적용(이 과정을 **재조정, Reconciliation**이라고 합니다)합니다. 실제 DOM을 직접, 여러 번 조작하는 것은 비용이 큰 작업이므로 이 방식을 통해 불필요한 렌더링을 줄여 성능을 최적화합니다.

**3. JSX가 무엇이며, 브라우저에서 어떻게 실행되는지 설명해주세요.**
*   **핵심 답변:** JSX(JavaScript XML)는 JavaScript를 확장한 문법으로, JavaScript 코드 안에서 HTML과 유사한 형태로 UI를 작성할 수 있게 해줍니다. 브라우저는 JSX를 직접 이해하지 못하므로, **Babel**과 같은 트랜스파일러가 JSX 코드를 `React.createElement()` 함수를 호출하는 일반 JavaScript 코드로 변환해줍니다.

**4. 함수형 컴포넌트와 클래스형 컴포넌트의 주요 차이점은 무엇인가요? 현재는 왜 함수형을 선호하나요?**
*   **핵심 답변:**
    *   **클래스형:** `React.Component`를 상속받고, `render()` 메소드를 사용하며, `this` 키워드를 통해 state와 props에 접근합니다. 생명주기 메소드를 사용합니다.
    *   **함수형:** 일반 JavaScript 함수 형태이며, **Hooks**(`useState`, `useEffect` 등)를 통해 상태 관리와 생명주기 기능을 사용합니다.
    *   **선호 이유:** 함수형 컴포넌트는 코드가 더 간결하고 직관적이며, `this` 바인딩의 복잡함이 없어 테스트와 재사용이 더 용이하기 때문입니다.

**5. State와 Props의 차이점을 설명해주세요. 데이터 흐름은 어떤 방향으로 이루어지나요?**
*   **핵심 답변:**
    *   **Props:** 부모 컴포넌트로부터 전달받는 데이터로, 자식 컴포넌트 내에서는 **읽기 전용(Immutable)**입니다.
    *   **State:** 컴포넌트 내부에서 자체적으로 관리하는 데이터로, **변경 가능(Mutable)**하며, state가 변경되면 컴포넌트가 리렌더링됩니다.
    *   **데이터 흐름:** React의 데이터 흐름은 부모에서 자식으로 흐르는 **단방향(Unidirectional)** 데이터 흐름을 따릅니다.

**6. 컴포넌트의 생명주기(Lifecycle)에 대해 설명해주세요.**
*   **핵심 답변:** 컴포넌트가 생성되고, 업데이트되고, 소멸되는 과정(Mounting → Updating → Unmounting)을 의미합니다.
    *   **클래스형:** `componentDidMount`(생성 후), `componentDidUpdate`(업데이트 후), `componentWillUnmount`(소멸 전) 같은 명시적인 메소드를 사용합니다.
    *   **함수형:** `useEffect` 훅을 통해 이 생명주기 기능들을 구현합니다. 예를 들어, 의존성 배열 `[]`은 `componentDidMount`와 유사하게 동작합니다.

**7. 리스트를 렌더링할 때 `key` prop이 왜 필수적인가요? `index`를 `key`로 사용하면 어떤 문제가 발생할 수 있나요?**
*   **핵심 답변:** `key`는 React가 각 리스트 항목을 식별하는 고유한 값입니다. Diffing 알고리즘이 `key`를 사용하여 리스트가 변경되었을 때 어떤 항목이 추가, 수정, 삭제되었는지 효율적으로 파악하고 최소한의 DOM 조작만 하도록 돕습니다. `index`를 `key`로 사용하면, 리스트 중간에 항목이 추가되거나 순서가 바뀔 때 `index`가 밀리면서 React가 항목을 잘못 인식하여 상태가 꼬이거나 성능이 저하될 수 있습니다.

**8. 제어 컴포넌트와 비제어 컴포넌트의 차이점을 설명하고, 각각 언제 사용하는 것이 좋은지 말해주세요.**
*   **핵심 답변:** `form` 요소의 상태를 누가 관리하느냐의 차이입니다.
    *   **제어 컴포넌트:** React의 `state`가 `form` 데이터의 유일한 원천이 됩니다. `value`와 `onChange`를 통해 모든 입력을 React가 제어합니다. 데이터 유효성 검사나 동적인 입력 제어가 필요할 때 주로 사용합니다.
    *   **비제어 컴포넌트:** 실제 DOM이 폼 데이터를 관리하고, 필요할 때 `ref`를 통해 값을 가져옵니다. 코드는 더 간단하며, 간단한 폼이나 파일 입력처럼 React가 굳이 제어할 필요가 없을 때 사용합니다.

**9. React에서 이벤트 핸들링은 어떻게 처리되나요?**
*   **핵심 답변:** React의 이벤트는 실제 DOM 이벤트와 약간 다릅니다. React는 모든 이벤트를 **이벤트 위임(Event Delegation)** 방식으로 최상위 레벨에서 관리하며, **합성 이벤트(SyntheticEvent)** 객체를 생성하여 이벤트 핸들러에 전달합니다. 이를 통해 브라우저 간의 이벤트 처리 방식 차이를 정규화하여 크로스 브라우징 호환성을 높입니다.

**10. `children` prop은 무엇이며 어떻게 활용할 수 있나요?**
*   **핵심 답변:** 컴포넌트 태그 사이에 위치하는 모든 콘텐츠를 받는 특별한 prop입니다. 이를 통해 다른 컴포넌트나 JSX 구조를 자식으로 전달할 수 있습니다. `Card`, `Modal`, `Layout`과 같이 공통적인 래퍼(Wrapper) 컴포넌트를 만들 때 매우 유용합니다.

#### 🎣 Part 2: Hooks 심화 (11-22)

**11. `useEffect` 훅에 대해 상세히 설명해주세요.**
*   **핵심 답변:** 컴포넌트 렌더링 이후에 발생하는 부수 효과(Side Effects), 예를 들어 데이터 fetching, DOM 조작, 구독(subscription) 등을 수행하기 위한 훅입니다. 첫 번째 인자로 실행할 함수를, 두 번째 인자로 의존성 배열을 받습니다.

**12. `useEffect`의 의존성 배열을 `[]`로 두었을 때, 생략했을 때, 특정 값을 넣었을 때 각각 어떻게 동작하나요?**
*   **핵심 답변:**
    *   `[]` (빈 배열): 컴포넌트가 **처음 마운트될 때 한 번만** 실행됩니다.
    *   생략 시: 컴포넌트가 **리렌더링될 때마다** 실행됩니다. (주의해서 사용해야 함)
    *   `[value]`: 마운트 시 한 번 실행되고, 배열 안의 **`value`가 변경될 때마다** 실행됩니다.

**13. `useEffect`의 반환 함수(Clean-up function)는 언제 호출되며, 어떤 용도로 사용되나요?**
*   **핵심 답변:** 컴포넌트가 언마운트될 때, 또는 의존성 배열의 값이 바뀌어 다음 effect 함수가 실행되기 직전에 호출됩니다. 주로 메모리 누수를 방지하기 위해 사용했던 리소스(타이머, 이벤트 리스너, 구독 등)를 정리하는 용도로 사용됩니다.

**14. `useState`의 상태 업데이트 함수는 동기적으로 동작하나요, 비동기적으로 동작하나요? 그 이유는 무엇인가요?**
*   **핵심 답변:** 비동기적으로 동작합니다. React는 짧은 시간 안에 여러 개의 상태 변경이 발생하면, 이를 하나로 묶어서(Batching) 한 번만 리렌더링을 실행하여 성능을 최적화합니다. 따라서 `setState` 호출 직후에 state가 즉시 반영되지 않을 수 있습니다. (React 18부터는 이벤트 핸들러 외부에서도 자동 배칭이 지원됩니다.)

**15. `useMemo`와 `useCallback`의 차이점은 무엇이며, 각각 어떤 상황에서 성능 최적화를 위해 사용해야 하나요?**
*   **핵심 답변:** 둘 다 메모이제이션(Memoization)을 위한 훅이지만 대상이 다릅니다.
    *   **`useMemo`:** 복잡한 연산의 **결과 값(value)**을 메모이제이션합니다. 의존성 배열의 값이 바뀌지 않으면 이전 연산 결과를 재사용합니다.
    *   **`useCallback`:** **함수(function)** 자체를 메모이제이션합니다. 의존성 배열의 값이 바뀌지 않으면 이전에 생성된 함수를 재사용합니다. 주로 자식 컴포넌트에 props로 함수를 전달할 때, 불필요한 리렌더링을 방지하기 위해 (`React.memo`와 함께) 사용합니다.

**16. `useMemo`나 `useCallback`을 불필요하게 남용하면 어떤 단점이 있을 수 있나요?**
*   **핵심 답변:** 메모이제이션 자체에도 비용이 듭니다. 이전 값이나 함수, 그리고 의존성 배열을 비교하는 과정이 필요하기 때문입니다. 따라서 매우 가벼운 연산이나 함수에 남용하면, 오히려 성능을 미세하게 저하시키고 코드의 가독성만 해칠 수 있습니다. 정말로 비용이 큰 연산이나, `React.memo`와 연계하여 확실한 리렌더링 방지 효과가 있을 때 사용해야 합니다.

**17. `useRef`의 두 가지 주요 사용 사례는 무엇인가요?**
*   **핵심 답변:**
    1.  **DOM 요소에 직접 접근:** 특정 DOM 노드에 접근하여 포커스를 주거나, 크기를 측정하거나, 미디어를 제어하는 등 직접적인 조작이 필요할 때 사용합니다.
    2.  **리렌더링을 유발하지 않는 값 저장:** 컴포넌트의 생애주기 동안 계속 유지되어야 하지만, 그 값이 바뀐다고 해서 굳이 리렌더링이 필요 없는 값(예: 이전 state 값, 타이머 ID 등)을 저장하는 용도로 사용합니다.

**18. 커스텀 훅(Custom Hook)을 만들어 본 경험이 있나요? 왜 만들었으며, 어떤 장점이 있었나요?**
*   **핵심 답변:** 커스텀 훅은 여러 컴포넌트에서 반복적으로 사용되는 상태 관리 로직을 추출하여 재사용 가능하게 만든 함수입니다. 이름은 반드시 `use`로 시작해야 합니다. 예를 들어, `useFetch`나 `useInput` 같은 훅을 만들어 데이터 fetching 로직이나 폼 입력 로직을 여러 컴포넌트에서 간편하게 재사용할 수 있습니다. 이를 통해 코드 중복을 줄이고 컴포넌트를 더 깔끔하게 유지할 수 있습니다.

**19. `useReducer`는 언제 `useState`보다 유용한가요?**
*   **핵심 답변:** 여러 개의 하위 값을 가지는 복잡한 상태 객체를 다루거나, 다음 상태가 이전 상태에 의존적인 로직이 많을 때 `useState`보다 `useReducer`가 더 유용합니다. 상태 업데이트 로직을 컴포넌트 밖의 리듀서 함수로 분리할 수 있어 코드 관리가 용이하고 테스트가 쉬워집니다.

**20. `useContext`를 사용해 본 경험에 대해 말해주세요. Context API의 단점은 무엇이라고 생각하시나요?**
*   **핵심 답변:** `useContext`는 Prop Drilling 문제 없이 여러 컴포넌트에 걸쳐 전역적인 데이터를 공유하기 위해 사용합니다. 예를 들어, 테마 정보나 사용자 로그인 상태를 모든 컴포넌트에서 쉽게 접근하게 할 수 있습니다. 단점은, Context의 값이 변경되면 해당 Context를 구독하는 모든 컴포넌트가 불필요하게 리렌더링될 수 있다는 점입니다. 이로 인해 성능 이슈가 발생할 수 있습니다.

**21. 훅의 규칙(Rules of Hooks) 두 가지는 무엇이며, 왜 이런 규칙이 필요한가요?**
*   **핵심 답변:**
    1.  **최상위 레벨에서만 호출:** 반복문, 조건문, 중첩 함수 내에서 훅을 호출하면 안 됩니다.
    2.  **React 함수 컴포넌트 내에서만 호출:** 일반 JavaScript 함수에서는 훅을 호출할 수 없습니다.
    *   **이유:** React는 훅이 호출되는 순서에 의존하여 상태를 관리합니다. 이 규칙을 지켜야만 컴포넌트가 렌더링될 때마다 훅의 호출 순서가 동일하게 유지되어 상태를 올바르게 연결할 수 있습니다.

**22. `useLayoutEffect`는 `useEffect`와 어떻게 다른가요?**
*   **핵심 답변:** 실행 시점이 다릅니다. `useEffect`는 브라우저가 화면을 그린 **이후에** 비동기적으로 실행되는 반면, `useLayoutEffect`는 DOM 변경이 완료되고 브라우저가 화면을 그리기 **직전에** 동기적으로 실행됩니다. 따라서 DOM을 직접 조작하여 화면 깜빡임을 방지해야 하는 등 렌더링 직전에 처리해야 할 작업이 있을 때 사용하지만, 대부분의 경우에는 `useEffect`로 충분합니다.

#### ⚙️ Part 3: 렌더링과 성능 최적화 (23-31)

**23. React 컴포넌트가 리렌더링되는 조건은 무엇인가요?**
*   **핵심 답변:** 1) 자신의 `state`가 변경될 때, 2) 부모로부터 받는 `props`가 변경될 때, 3) 부모 컴포넌트가 리렌더링될 때 (자신의 props 변경과 무관하게), 4) `forceUpdate()`가 호출될 때입니다.

**24. 불필요한 리렌더링을 방지하기 위한 방법들을 아는 대로 설명해주세요.**
*   **핵심 답변:** `React.memo`를 사용하여 props가 변경되지 않은 컴포넌트의 리렌더링을 방지하고, `useCallback`으로 함수를, `useMemo`로 값을 메모이제이션하여 자식 컴포넌트에 전달되는 props가 불필요하게 재생성되지 않도록 합니다. 또한, state를 필요한 컴포넌트에 가깝게 위치시켜 불필요한 전파를 막는 방법도 있습니다.

**25. `React.memo`는 어떻게 동작하며, `useCallback`과 함께 어떻게 시너지를 낼 수 있나요?**
*   **핵심 답변:** `React.memo`는 컴포넌트를 감싸는 고차 컴포넌트(HOC)로, props에 대한 얕은 비교(shallow comparison)를 통해 props가 변경되었을 때만 컴포넌트를 리렌더링합니다. 만약 자식 컴포넌트에 함수를 props로 전달할 때 부모가 리렌더링되면 함수도 새로 생성되어 `React.memo`가 제대로 동작하지 않는데, 이때 `useCallback`으로 함수를 메모이제이션하면 자식 컴포넌트의 불필요한 리렌더링을 막는 시너지를 낼 수 있습니다.

**26. 코드 스플리팅(Code Splitting)이란 무엇이며, React에서는 어떻게 적용할 수 있나요?**
*   **핵심 답변:** 거대한 하나의 번들 파일을 여러 개의 작은 청크(chunk)로 나누는 기술입니다. 이를 통해 초기 로딩 시 모든 코드를 불러오는 대신, 당장 필요한 코드만 불러와 초기 로딩 속도를 크게 개선할 수 있습니다. React에서는 `React.lazy()`와 `Suspense`를 함께 사용하여 컴포넌트 단위로 코드 스플리팅을 동적으로 구현할 수 있습니다.

**27. 서버 사이드 렌더링(SSR)과 클라이언트 사이드 렌더링(CSR)의 차이점, 장단점을 설명해주세요.**
*   **핵심 답변:**
    *   **CSR (Client-Side Rendering):** 브라우저가 최소한의 HTML과 JavaScript 번들을 받아온 후, JavaScript를 실행하여 DOM을 동적으로 생성하고 렌더링합니다. 초기 로딩은 느리지만, 이후 페이지 전환은 빠릅니다. (일반적인 React 앱)
    *   **SSR (Server-Side Rendering):** 서버에서 렌더링할 페이지의 HTML을 모두 만들어서 브라우저에 전달합니다. 초기 로딩 속도가 매우 빠르고 검색 엔진 최적화(SEO)에 유리하지만, 서버 부하가 커지고 페이지 전환 시 매번 서버에 요청해야 합니다. (`Next.js` 같은 프레임워크가 이를 지원합니다.)

**28. React 18에서 도입된 동시성(Concurrency)의 개념은 무엇이며, 이를 통해 어떤 사용자 경험을 개선할 수 있나요?**
*   **핵심 답변:** 동시성이란 렌더링을 중단했다가 나중에 다시 재개할 수 있는 기능입니다. 이를 통해 React는 여러 상태 업데이트의 우선순위를 정할 수 있습니다. 예를 들어, 사용자의 입력과 같이 긴급한 업데이트가 큰 데이터 목록을 렌더링하는 덜 긴급한 업데이트 때문에 지연되는 것을 막아, UI가 멈추는 현상 없이 부드러운 사용자 경험을 제공할 수 있습니다.

**29. `useTransition`과 `useDeferredValue`는 어떤 문제를 해결하기 위해 등장했나요?**
*   **핵심 답변:** 둘 다 동시성 기능을 활용하는 훅으로, 긴급하지 않은 업데이트를 뒤로 미뤄 UI 반응성을 높이기 위해 사용됩니다.
    *   `useTransition`: 특정 상태 업데이트를 '긴급하지 않음(non-urgent)'으로 표시하여, 이 업데이트로 인한 렌더링이 다른 긴급한 렌더링을 막지 않도록 합니다.
    *   `useDeferredValue`: 특정 값의 변경을 잠시 지연시켜, 그 값으로 인한 렌더링을 나중에 처리하도록 합니다. 사용자가 입력하는 동안 검색 결과를 보여줄 때 유용합니다.

**30. 웹 성능 최적화를 위해 시도해 본 경험이 있다면 구체적으로 설명해주세요.**
*   **핵심 답변:** (경험 기반 답변 예시) "Lighthouse 점수를 측정하여 초기 로딩 성능 저하의 원인을 분석했습니다. Webpack Bundle Analyzer를 사용해 번들 크기를 확인하고, 사용하지 않는 라이브러리를 제거하고 `React.lazy`를 통한 코드 스플리팅을 적용하여 초기 로딩 속도를 약 30% 개선했습니다. 또한, 큰 이미지 파일은 WebP 포맷으로 변환하고 lazy loading을 적용하여 이미지 렌더링 속도를 개선한 경험이 있습니다."

**31. 고차 컴포넌트(HOC, Higher-Order Component)란 무엇이며, Hooks와 비교했을 때 어떤 차이가 있나요?**
*   **핵심 답변:** HOC는 컴포넌트를 인자로 받아 새로운 컴포넌트를 반환하는 함수입니다. 컴포넌트 간에 공통 로직(예: 인증 체크, 로깅)을 재사용하기 위해 사용됩니다. Hooks와 비교했을 때, HOC는 래퍼 컴포넌트를 추가하여 props를 주입하는 방식이라 `Wrapper Hell`(컴포넌트 트리가 복잡해지는 현상)을 유발할 수 있습니다. 반면, Hooks는 로직을 컴포넌트 안으로 직접 가져와 사용하므로 더 간결하고 직관적이며 조합하기 쉽습니다.

#### 🌐 Part 4: 상태 관리와 생태계 (32-42)

**32. Prop Drilling이란 무엇이며, 이 문제를 해결하기 위한 방법들은 어떤 것들이 있나요?**
*   **핵심 답변:** Prop Drilling은 상태를 직접 사용하지 않는 중간 컴포넌트들을 거쳐 여러 단계 아래의 자식 컴포넌트에게 props를 전달하는 문제입니다. 코드의 가독성과 유지보수성을 크게 떨어뜨립니다. 해결 방법으로는 **Context API**를 사용하거나 **Redux, Zustand** 같은 전역 상태 관리 라이브러리를 도입하는 방법이 있습니다.

**33. 상태 끌어올리기(Lifting State Up) 패턴에 대해 설명해주세요.**
*   **핵심 답변:** 여러 자식 컴포넌트가 동일한 상태를 공유하고 동기화해야 할 때, 그 상태를 가장 가까운 공통 조상 컴포넌트로 이동시켜 관리하는 디자인 패턴입니다. 이를 통해 상태를 단일 소스(Single Source of Truth)에서 관리하고, props를 통해 자식들에게 내려주어 상태를 일관되게 유지할 수 있습니다.

**34. 전역 상태 관리 라이브러리(Redux, Zustand 등)가 필요한 이유는 무엇이며, Context API만으로는 부족한 경우는 언제인가요?**
*   **핵심 답변:** 애플리케이션의 규모가 커지고 상태 로직이 복잡해질 때 필요합니다. Context API는 값이 변할 때마다 모든 구독 컴포넌트를 리렌더링시켜 성능 이슈가 발생할 수 있습니다. 반면, Redux나 Zustand 같은 라이브러리는 **선택자(Selector)를 통해 필요한 상태만 구독**하여 불필요한 리렌더링을 막고, **미들웨어**를 통한 비동기 처리, **DevTools**를 이용한 쉬운 디버깅 등 복잡한 애플리케이션을 관리하기 위한 강력한 기능들을 제공합니다.

**35. Redux의 세 가지 원칙과 데이터 흐름에 대해 설명해주세요.**
*   **핵심 답변:**
    *   **세 가지 원칙:** 1) 진실은 하나의 소스에(Single source of truth): 모든 상태는 하나의 스토어에 저장됩니다. 2) 상태는 읽기 전용이다(State is read-only): 상태를 바꾸려면 반드시 액션을 디스패치해야 합니다. 3) 변경은 순수 함수로 작성된다(Changes are made with pure functions): 상태 변경은 순수 함수인 리듀서를 통해 이루어져야 합니다.
    *   **데이터 흐름:** UI에서 **Action**을 생성하여 `dispatch` 함수로 보냅니다 → **Store**는 이 Action을 받아 등록된 **Reducer** 함수를 호출합니다 → Reducer는 이전 상태와 Action을 받아 새로운 상태를 반환합니다 → Store의 상태가 변경되면, 이를 구독하고 있는 UI가 리렌더링됩니다.

**36. Redux Toolkit(RTK)을 사용하면 기존 Redux 방식에 비해 어떤 점이 편리해지나요?**
*   **핵심 답변:** RTK는 기존 Redux의 단점인 **많은 보일러플레이트 코드(boilerplate code)**를 크게 줄여줍니다. `createSlice`를 통해 액션 생성자와 리듀서를 한 번에 만들 수 있고, `Immer` 라이브러리가 내장되어 있어 불변성을 신경 쓰지 않고도 `state.value = 1`과 같이 직관적으로 상태를 업데이트할 수 있습니다. 또한, 스토어 설정이나 비동기 로직 처리가 훨씬 간편해집니다.

**37. Zustand나 Recoil 같은 최신 상태 관리 라이브러리를 사용해 본 경험이 있나요? Redux와의 차이점은 무엇이라고 생각하시나요?**
*   **핵심 답변:** Zustand는 Redux에 비해 훨씬 설정이 간단하고 보일러플레이트가 거의 없습니다. Hooks 기반으로 만들어져 React와 더 자연스럽게 통합되고, 스토어를 여러 개 만들 수 있으며 `Context.Provider`로 앱을 감쌀 필요도 없습니다. Redux가 엄격한 구조를 강제하는 반면, Zustand는 더 유연하고 간편하여 소규모 프로젝트나 빠른 개발에 더 적합하다고 생각합니다.

**38. 클라이언트 상태와 서버 상태는 어떻게 다른가요?**
*   **핵심 답변:**
    *   **클라이언트 상태:** UI의 상태와 직접적으로 관련된 데이터입니다. 예를 들어, 다크 모드 여부, 모달의 열림 상태, 폼 입력 값 등이 해당됩니다. 브라우저 내에서만 존재하고, 사용자가 제어합니다.
    *   **서버 상태:** 서버의 데이터베이스에 저장되는 데이터로, 우리는 이 데이터에 대한 소유권이 없습니다. 비동기적으로 가져와야 하고, 언제든지 다른 사용자에 의해 변경될 수 있어 '오래된(stale)' 상태가 될 수 있습니다. 캐싱, 동기화, 재요청(refetching) 같은 복잡한 관리가 필요합니다.

**39. `React Query`나 `SWR` 같은 라이브러리는 어떤 문제를 해결해주며, 이를 사용했을 때의 장점은 무엇인가요?**
*   **핵심 답변:** 이 라이브러리들은 복잡한 **서버 상태 관리**를 매우 쉽게 만들어줍니다. `useEffect`와 `useState`로 직접 서버 데이터를 가져오고 관리할 때 발생하는 번거로운 작업들, 즉 로딩 및 에러 상태 관리, 캐싱, 포커스 시 자동 재요청, 데이터 동기화 등을 자동으로 처리해줍니다. 이를 통해 코드가 매우 간결해지고, 사용자에게는 항상 최신 데이터를 보여주는 긍정적인 경험을 제공할 수 있습니다.

**40. React Router를 사용하여 동적 라우팅(Dynamic Routing)과 중첩 라우팅(Nested Routing)을 어떻게 구현하나요?**
*   **핵심 답변:**
    *   **동적 라우팅:** 경로에 변수를 포함시키는 것입니다. 예를 들어, `/users/:userId`와 같이 경로를 설정하고 `useParams` 훅을 사용하여 `:userId` 값을 컴포넌트 내에서 가져와 해당 ID에 맞는 데이터를 보여줄 수 있습니다.
    *   **중첩 라우팅:** 부모 라우트 컴포넌트 내에 `<Outlet />` 컴포넌트를 배치하고, 라우트 설정에서 자식 라우트들을 정의하여 구현합니다. 이를 통해 공통 레이아웃(예: 대시보드의 사이드바)을 유지하면서 내부 콘텐츠만 변경하는 UI를 쉽게 만들 수 있습니다.

**41. React에서 스타일링하는 방법들(CSS-in-JS, CSS Modules, Tailwind CSS 등)의 장단점을 비교 설명해주세요.**
*   **핵심 답변:**
    *   **CSS-in-JS (e.g., Styled-components):** JavaScript 코드 안에서 컴포넌트 단위로 스타일을 작성합니다. 동적 스타일링이 쉽고 클래스 이름 충돌이 없다는 장점이 있지만, 런타임 오버헤드가 있을 수 있습니다.
    *   **CSS Modules:** CSS 파일을 컴포넌트에 종속시켜 클래스 이름을 고유하게 만들어 스타일 충돌을 방지합니다. 일반 CSS 문법을 그대로 사용할 수 있다는 장점이 있습니다.
    *   **Tailwind CSS:** 미리 정의된 유틸리티 클래스(e.g., `flex`, `pt-4`, `text-center`)를 HTML(JSX)에 직접 조합하여 스타일링합니다. 개발 속도가 매우 빠르지만, 클래스 이름이 길어질 수 있고 초기 학습 곡선이 있습니다.

**42. React에서 테스트 코드를 작성해 본 경험이 있나요?**
*   **핵심 답변:** 네, **Jest**와 **React Testing Library(RTL)**를 사용하여 컴포넌트 테스트를 작성한 경험이 있습니다. Jest는 테스트 러너(Test Runner)와 단언(assertion) 라이브러리를 제공하고, RTL은 컴포넌트의 내부 구현보다는 **사용자 관점**에서 컴포넌트가 올바르게 렌더링되고 상호작용하는지를 테스트하는 철학을 가지고 있습니다. 예를 들어, 특정 텍스트를 가진 버튼이 렌더링되는지, 그 버튼을 클릭했을 때 특정 함수가 호출되는지를 테스트했습니다.

#### 🚀 Part 5: 프로젝트 및 경험 기반 (43-50)

*(이 파트는 정답이 없으며, 본인의 경험을 논리적으로 설명하는 것이 중요합니다.)*

**43. 진행했던 프로젝트 중 가장 기술적으로 어려웠던 점은 무엇이었고, 어떻게 해결했나요?**
*   **답변 가이드:** **STAR 기법(Situation, Task, Action, Result)**을 활용하여 답변하세요.
    *   **(S) 상황:** "대용량 데이터를 실시간으로 차트에 렌더링해야 하는 프로젝트에서..."
    *   **(T) 과제:** "...잦은 데이터 업데이트로 인해 UI가 멈추는 심각한 성능 저하 문제가 있었습니다."
    *   **(A) 행동:** "문제 해결을 위해 React Profiler로 병목 구간을 분석했고, 불필요한 리렌더링이 원인임을 파악했습니다. `useMemo`를 사용해 복잡한 데이터 가공 로직을 메모이제이션하고, 차트 라이브러리의 가상화(virtualization) 옵션을 적용하여 화면에 보이는 부분만 렌더링하도록 개선했습니다."
    *   **(R) 결과:** "그 결과, UI 멈춤 현상이 사라지고 렌더링 성능이 약 70% 향상되어 부드러운 사용자 경험을 제공할 수 있었습니다."

**44. 프로젝트의 폴더 구조는 어떤 식으로 설계하시나요? 그 이유는 무엇인가요?**
*   **답변 가이드:** 정답은 없지만, 일관성과 확장성을 강조하세요. "주로 **기능 기반(feature-based)** 폴더 구조를 선호합니다. `components`, `pages`, `hooks` 처럼 기술별로 나누는 대신, `user`, `order`, `product`처럼 도메인이나 기능 단위로 폴더를 구성합니다. 그 안에는 해당 기능에 필요한 컴포넌트, 훅, API 호출 함수 등을 함께 둡니다. 이렇게 하면 관련 코드가 한곳에 모여 있어 유지보수가 쉽고, 특정 기능을 수정하거나 제거할 때 다른 부분에 미치는 영향을 최소화할 수 있습니다."

**45. 코드의 가독성과 유지보수성을 높이기 위해 어떤 노력을 하시나요?**
*   **답변 가이드:** 구체적인 예를 드세요. "의미 있는 변수와 함수 이름을 사용하고, 하나의 컴포넌트나 함수는 하나의 책임만 갖도록(단일 책임 원칙) 작게 분리하려고 노력합니다. 복잡한 로직에는 주석을 작성하고, 팀 내에서 합의된 Prettier나 ESLint 같은 코드 포맷팅 및 린팅 규칙을 철저히 지켜 일관된 코드 스타일을 유지합니다."

**46. 본인이 생각하는 좋은 컴포넌트란 무엇인가요?**
*   **답변 가이드:** 재사용성, 단일 책임, 예측 가능성을 언급하세요. "좋은 컴포넌트는 **단일 책임 원칙**을 지키며 하나의 기능에만 집중하고, **재사용이 용이**해야 한다고 생각합니다. 또한, props를 통해 예측 가능하게 동작해야 하며, 내부 구현을 몰라도 쉽게 가져다 쓸 수 있도록 **캡슐화**가 잘 되어 있어야 합니다."

**47. 다른 개발자와의 협업 시 가장 중요하게 생각하는 것은 무엇인가요?**
*   **답변 가이드:** 커뮤니케이션과 존중을 강조하세요. "명확하고 적극적인 **커뮤니케이션**이 가장 중요하다고 생각합니다. 기술적인 의견 차이가 있을 때, 자신의 의견만 고집하기보다 상대방의 의견을 경청하고 합리적인 근거를 바탕으로 토론하여 더 나은 결정을 내리는 자세가 중요합니다. 또한, 코드 리뷰 시 비난이 아닌 건설적인 피드백을 주고받는 문화와, Git 커밋 메시지 컨벤션을 지키는 등 약속된 규칙을 잘 따르는 것도 중요합니다."

**48. TypeScript를 React 프로젝트에 사용했을 때의 장점은 무엇이라고 생각하시나요?**
*   **핵심 답변:** 가장 큰 장점은 **타입 안정성**입니다. 컴파일 시점에 타입을 체크하여 런타임 에러를 사전에 방지할 수 있고, props로 어떤 타입의 데이터를 전달해야 하는지 명확하게 알 수 있어 개발 생산성과 코드의 안정성을 크게 높여줍니다. 또한, 자동 완성과 같은 IDE의 지원을 통해 개발 경험이 향상됩니다.

**49. 웹 접근성을 개선하기 위해 노력한 경험이 있나요?**
*   **핵심 답변:** 시맨틱 HTML 태그(`header`, `nav`, `main` 등)를 올바르게 사용하여 문서의 구조를 명확히 하고, 모든 이미지에 의미 있는 `alt` 속성을 제공했습니다. 또한, 키보드만으로 모든 기능에 접근하고 조작할 수 있도록 `tabindex`와 포커스 관리에 신경 썼으며, `aria-label` 같은 ARIA 속성을 사용하여 스크린 리더 사용자에게 추가적인 정보를 제공한 경험이 있습니다.

**50. 지속적으로 성장하기 위해 어떤 노력을 하고 있나요?**
*   **답변 가이드:** 구체적이고 진솔하게 답변하세요. "React 공식 블로그나 주요 기술 커뮤니티(e.g., dev.to, Medium)의 최신 아티클을 꾸준히 읽으며 기술 트렌드를 놓치지 않으려고 노력합니다. 최근에는 사이드 프로젝트를 통해 `Next.js 14`의 서버 액션과 같은 새로운 기능을 직접 적용해보며 학습하고 있습니다. 또한, 동료들과 정기적으로 스터디를 진행하며 지식을 공유하고 함께 성장하는 것을 중요하게 생각합니다."

---

### 📚 참고 자료 (References)
1.  **React 공식 문서 (react.dev)**
    *   **링크:** [https://react.dev/learn](https://react.dev/learn)
    *   **설명:** React의 모든 기본 개념, Hooks, 렌더링 원리 등에 대한 가장 정확한 정보 소스입니다. 면접 준비의 기본입니다.

2.  **React 18 소개 (React Blog)**
    *   **링크:** [https://react.dev/blog/2022/03/29/react-v18](https://react.dev/blog/2022/03/29/react-v18)
    *   **설명:** React 18의 핵심인 동시성(Concurrency)과 `useTransition` 같은 새로운 기능에 대해 공식적으로 설명하는 글입니다.

3.  **Redux Toolkit 공식 문서**
    *   **링크:** [https://redux-toolkit.js.org/](https://redux-toolkit.js.org/)
    *   **설명:** 현대적인 Redux 사용법과 상태 관리 패턴을 이해하는 데 필수적인 문서입니다.

4.  **TanStack Query (React Query) 공식 문서**
    *   **링크:** [https://tanstack.com/query/latest/docs/react/overview](https://tanstack.com/query/latest/docs/react/overview)
    *   **설명:** 서버 상태 관리의 개념과 `React Query`의 강력한 기능(캐싱, 동기화 등)을 학습할 수 있습니다.

5.  **React Router 공식 문서**
    *   **링크:** [https://reactrouter.com/en/main](https://reactrouter.com/en/main)
    *   **설명:** React 애플리케이션의 라우팅 구현에 대한 모든 정보를 담고 있습니다.

6.  **"A Visual Guide to React Rendering" - by Alex Sidorenko**
    *   **링크:** [https://alexsidorenko.com/blog/react-render-always-rerenders/](https://alexsidorenko.com/blog/react-render-always-rerenders/)
    *   **설명:** React의 리렌더링 메커니즘을 시각적으로 매우 쉽게 설명하여, 성능 최적화 관련 질문을 이해하는 데 큰 도움이 되는 유명한 아티클입니다.
